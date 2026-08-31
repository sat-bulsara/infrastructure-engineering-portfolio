# Secure VM and exam transcript adaptation

Date: 2026-08-26

Two supplied transcripts were compared with the saved Azure roadmap and current
Microsoft guidance. Useful ideas were added to existing projects instead of
creating duplicate builds.

Projects 14, 17, 18, 23 and 27 now form a clearer secure-compute progression:
predict the VM dependency graph, avoid internet-wide management ports, compare
restricted temporary access with Bastion and just-in-time access, prove access
before and after rule removal, inspect lifecycle billing and troubleshoot the
whole connection path. The roadmap also records that port 443 filtering is not
web-content inspection and does not make an HTTPS destination trustworthy.

Project 31 and the certification checkpoint now use the official Practice
Assessment as a gap detector. Incorrect and uncertain answers enter a correction
log, are checked against current Microsoft documentation and lead to changed
repair mini-labs. Third-party questions and cram material remain supplementary.

No learner skill was assessed during this roadmap review.
