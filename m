Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539763BAD91
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271577; cv=none; b=D61HCDAptV6rcGixOprd39L5+82FG86MzWdH/B6OOUBQst78NSX+eGBm5l2TI8d2u1mhVfvKB234MwQW1fnGqaevMlyquAwbdTk0wWfFPz6LhJgjkKgYU951nuVqU2xVSH7U9fioDdmKwCO0QH+6bLKi4Sf2YUVRUDaC6/sDlqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271577; c=relaxed/simple;
	bh=v3oM0twAdKWn7xXkH9HDOSWpHQIYPMBHXMt+qxwQrOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKLJo8uiYK60FZQtTpjknNc/Ziku1f0oC2hVN9g5FBkX6TldYSrA5D6fu+eqAGTRRuLAC1tg29RRqFemFp7BcjQ7zjDkAGEOriFkrWUmZpY20VC6tk241M3Qt3fcxmtHCxLkKTlm1P9dCUlrj8lA5L1/s0H7Wlhc5+sJFH/EI2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zze0eGit; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zze0eGit"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FEC1F000E9;
	Wed, 20 May 2026 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271574;
	bh=AJfag3m3S8UqPGbPf41cHNoFs8uMNaQOdsJ7PwzcZrs=;
	h=From:To:Cc:Subject:Date;
	b=Zze0eGitm4yQ8MlzwnI7QsYoWY2e40PApkwKGF1bN9tYWkiwblDFH2wMwPcG+qVCR
	 6az9kBGoEJsXjcyU45hoqYj7Wz2pXaNOCJRJ3bESRWYw9tDEYk9MJShJTnED/bm7Z/
	 Nkq1U/qaLpDrSQHhCdApXCrGeqtzDeNV1zZrcLnmvB67Ume3Vl2n3XyA0FBpMRkQHd
	 rEzuH1+/3OHflJRoXqf2cSO2xRfOhDy6kP8dR0zozPXdZeLQG2sqaLQJdUWgKyEEkG
	 x22bnfrTPLjHW0NJF7KhveMpMVnw8hnGY9tOjOdHVXp7WpeWIH2/Zy/RJwc2fthpq1
	 GoU6j9TlQ0ZvA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCHv2 0/2] media: vivid: add vb2_is_busy() checks
Date: Wed, 20 May 2026 10:36:20 +0200
Message-ID: <cover.1779266182.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a number of controls that change the behavior of
cropping/composing/scaling, and they all call vivid_update_format_cap/out.

But that function resets the format, so this needs a vb2_is_busy()
check.

The REDUCED_FPS control also calls vivid_update_format_cap(), but it
doesn't really need that, it can just update the frame period on
the fly.

The first patch deals with the REDUCED_FPS control, and the second
adds the vb2_is_busy() check for the crop/compose/scale capability
controls.

I could reproduce the syzbot crash by manipulating these controls,
and with these patches it no longer crashes.

Regards,

	Hans

Hans Verkuil (2):
  media: vivid: add vivid_update_reduced_fps()
  media: vivid: check for vb2_is_busy() when toggling caps

 .../media/test-drivers/vivid/vivid-ctrls.c    | 15 +++++++-
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 38 ++++++++++++-------
 .../media/test-drivers/vivid/vivid-vid-cap.h  |  1 +
 .../media/test-drivers/vivid/vivid-vid-out.c  |  6 +++
 4 files changed, 46 insertions(+), 14 deletions(-)

-- 
2.53.0

