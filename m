Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538293;
	b=QOnkW1FcbWEaBtFQqjcXOGbv/wk04GkD25Ca2l/chZuLOk+S7ga/j+QEk4jeWjfeMUqa
	 IoteaF99uXMQiwbMc8bha6SUgh17M3Px1tXa4+zs40+vXrxv+F/arbG2L/Oa1KDDDP7d3
	 uOXteZG9MVXOlv6kChgOGYyNtwMZN3d2AHXjrkr/RZEqkxTsbO8f1xJs6vPj22lxGXnF8
	 cPAiYGoklE03mXFW6o1Oeaq+QdefFQS/QQo2LC167ivfMa1mOmlMmR1KSUSuo9yMBqOKt
	 brsc06XQ9RLPsNeCEIQSrmJ97mj0XWNCAcwULupCszfm2hzj5RsleHm1KXpCuxjg9cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538293;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=0Rrk8FMNS7+lDZOi25AVFPgIuiYIRkM2mK0uzC6u4r0=;
	b=Uiv4u0LN5RHtlTuRJNHCrOmlPhkt8w6ly5tIkqXeH+b2xy5X2OS8kv/BLT+seT0NUWZn
	 eNcsFqH3eNoKUe/VSC7pLrFNAXKcsAcf7sCyWTK1Fg+dox88QJfkcZKHpm79lyox7xDzr
	 hVx76VhEw8F+ITmsN7SpdXW+4wFbOUkA8obanQCnbO2jzRk5CE8T31lfnF37v1CU+ia7S
	 H85EuUs9yqYuFwV4o3i/t/8HMajQKozbP2XLMHSK3UFt29OO7WnsiDH1RLrW0YxVLToyR
	 zfpM47c8sFYHauPy0BbNAekqmAM160LDO6v0BaaaEccH8gNoS8/vyEy8yU6/Tq3agVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UHbU21ZQ;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1EC606A326
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A1EC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UHbU21ZQ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DC62339;
	Tue, 24 Nov 2026 08:38:09 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD7013F86C;
	Tue, 24 Nov 2026 08:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795538292; bh=DjLWW56UL8n24bea22ajC36W7Mw06nIoL+ph89aC3Mw=;
	h=From:Date:Subject:To:Cc:From;
	b=UHbU21ZQasSX/xd2ntMqF3fH25F+s3LqDzO3OgAVcaKfuXJ16RM6YBPsWM6HHWiLr
	 E7LAez3Cn6vGbh1K7EFB81hGYlUiBPmErEgfSJGMGrzyXm8IGW+mQNBuStyW5a8SHW
	 biv/86CrKvd3L1oTPZ4lYbdrK6S6gL5zjSeM+muY=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 16:37:52 +0000
Subject: [PATCH] media: mc: Reject disconnected pads on an active pipeline
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-mali-c720-media-controller-fix-v1-1-961de9306170@arm.com>
X-B4-Tracking: v=1; b=H4sIAF+9BWsC/x2NQQrCMBBFr1Jm7WATS0SvIi4mydQOpIlMigild
 zdm8+H9xXs7VFbhCvdhB+WPVCm5gTkNEBbKL0aJjcGO1hljJ1wpCYarHXHlKISh5E1LSqw4yxc
 vPHs3xVuILkKTvJXb3QOPZ2NPldEr5bD8td1x7gvH8QNDcIw6jgAAAA==
X-Change-ID: 20261124-mali-c720-media-controller-fix-3efb64d9cd6d
To: linux-media@vger.kernel.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, laurent.pinchart@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795538290; l=1432;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=S9gKjSk3xFyt/VJLlNaUGX6UqUW3ZpNTNyEaSHWNjhU=;
 b=WWehGBDjgY0xOFgd2Dm5K1jGTUaLyWyIX5/HCZSwU1wnFKKo1i4rqt95ECxc+dkT453weYqJ+
 PS94+VQz+PrARc+kC4Y2hQtGFCSnCJzZ7r2A2UU5nE+BL0gLdpB7xtg
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=

From: Anthony McGivern <Anthony.McGivern@arm.com>

When starting an already active media pipeline, graph validation is skipped
and its start count is incremented. This allows a disconnected origin pad
to return success even though it does not belong to a pipeline.

Reject a disconnected origin pad with -EINVAL before incrementing the
start count.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 drivers/media/mc/mc-entity.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 7938f785e2e3c76372a585426faa0482d78083ef..4508afacdd68e2a9ab81261561997317ab525662 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -791,10 +791,13 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 		return -EINVAL;
 
 	/*
-	 * If the pipeline has already been started, it is guaranteed to be
-	 * valid, so just increase the start count.
+	 * If the pipeline has already been started, ensure the pad is a part of the pipeline.
+	 * If so, it is guaranteed to be valid, so just increase the start count.
 	 */
 	if (pipe->start_count) {
+		if (!origin->pipe)
+			return -EINVAL;
+
 		pipe->start_count++;
 		return 0;
 	}

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261124-mali-c720-media-controller-fix-3efb64d9cd6d

Best regards,
-- 
Anthony McGivern <Anthony.McGivern@arm.com>

