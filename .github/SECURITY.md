# Security

## Reporting a Bug in Science Center

Report security bugs in Science Center via [HackerOne](https://hackerone.com/ehharding).

Your report will be acknowledged within five days, and you'll receive a more detailed response to your report within ten
days indicating the next steps in handling your submission.

After the initial reply to your report, the security team will endeavor to keep you informed of the progress being made
towards a fix and full announcement, and may ask for additional information or guidance surrounding the reported issue.

## Reporting a Bug In a Third Party Module

Security bugs in third party modules should be reported to their respective maintainers.

## Disclosure Policy

Here is the security disclosure policy for the Science Center:

- The security report is received and is assigned a primary handler. This person will coordinate the fix and release
  process. The problem is confirmed and a list of all affected versions is determined. Code is audited to find any
  potential similar problems. Fixes are prepared for all releases which are still under maintenance. These fixes are not
  committed to the public repository but rather held locally pending the announcement.

- A suggested embargo date for this vulnerability is chosen and a CVE (Common Vulnerabilities and Exposures (CVE®)) is
  requested for the vulnerability.

- On the embargo date, the Science Center security mailing list is sent a copy of the announcement. The changes are
  pushed to the public repository and new builds are deployed to science-center. Within six hours of the mailing list
  being notified, a copy of the advisory will be published on the Science Center blog.

- Typically the embargo date will be set 72 hours from the time the CVE is issued. However, this may vary depending on
  the severity of the bug or difficulty in applying a fix.

- This process can take some time. Every effort will be made to handle the bug in as timely a manner as possible;
  However, it's important that we follow the release process above to ensure that the disclosure is handled in a
  consistent manner.

## Receiving Security Updates

Security notifications will be distributed via the following methods:

- <https://https://ehharding.github.io/science-center/en/blog/>

## Comments on This Policy

If you have suggestions on how this process could be improved please submit a
[Pull Request](https://github.com/ehharding/science-center) or
[file an Issue](https://github.com/ehharding/science-center/issues/new) to discuss.
