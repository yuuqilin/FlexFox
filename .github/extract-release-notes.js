// .github/extract-release-notes.js

const fs = require('fs');
const path = require('path');
const readline = require('readline');

const releaseTag = process.env.RELEASE_TAG;
if (!releaseTag) {
  console.error('RELEASE_TAG not defined.');
  process.exit(1);
}

const readmePath = path.resolve('README.md');
const outputDir = path.resolve('.github/release-notes');
const outputPath = path.join(outputDir, `${releaseTag}.md`);

/**
 * Reads a file line by line and extracts defined sections in sequence.
 * @param {Array} sections - An array of section descriptors.
 * @returns {Promise<Object>} - Object mapping section names to extracted content.
 */
async function extractSectionsSequentially(sections) {
  const stream = fs.createReadStream(readmePath, 'utf-8');
  const rl = readline.createInterface({ input: stream, crlfDelay: Infinity });

  let currentSection = null;
  let results = {};
  let collecting = false;

  for await (const line of rl) {
    // Start of new section
    if (!currentSection) {
      for (const section of sections) {
        if (line.includes(section.start)) {
          currentSection = section;
          results[section.name] = [];
          collecting = true;
          break;
        }
      }
      continue;
    }

    if (collecting) {
      // Abort condition (only for some sections like history)
      if (currentSection.abortOn && line.includes(currentSection.abortOn)) {
        results[currentSection.name] = '';
        currentSection = null;
        collecting = false;
        continue;
      }

      // End of section
      if (line.includes(currentSection.end)) {
        results[currentSection.name] = results[currentSection.name].join('\n').trim();
        currentSection = null;
        collecting = false;
        continue;
      }

      results[currentSection.name].push(line);
    }
  }

  // Finalize any section still being collected (e.g. no end marker)
  for (const section of sections) {
    if (Array.isArray(results[section.name])) {
      results[section.name] = results[section.name].join('\n').trim();
    }
  }

  return results;
}

(async () => {
  try {
    // Define the two sections to extract, in order
    const sections = [
      {
        name: 'whatsNew',
        start: '## 🆕 What\'s New',
        end: '<!-- END What\'s New -->'
      },
      {
        name: 'history',
        start: '<summary>💬 <b>Previous Updates</b></summary>',
        end: '<!-- END Release Note -->',
        abortOn: '<a href="#updates-top-start">⏫ Back to the beginning of updates</a>'
      }
    ];

    const { whatsNew, history } = await extractSectionsSequentially(sections);

    if (!whatsNew) {
      console.log('No "What\'s New" section found, skipping release notes generation.');
      process.exit(0); // Fallback to GitHub auto-generated release notes
    }

    // Combine sections
    let combined = whatsNew;
    if (history) {
      combined += '\n\n' + history;
    }

    // Write to file
    await fs.promises.mkdir(outputDir, { recursive: true });
    await fs.promises.writeFile(outputPath, combined, 'utf8');
    console.log(`✅ Release notes written to ${outputPath}`);
  } catch (err) {
    console.error('❌ Error extracting release notes:', err);
    process.exit(1);
  }
})();
