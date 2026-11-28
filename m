Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795829080;
	b=MpsWr4mG9dhxV/c8ajLaiDdvdy3QtGa4rQfPBPRe7ucDPMGJcQnqQdF+TIdHY8bjMwn+
	 yt6BhPln0hP528iRjxaCeFflDRfr+NAVPXY6F+oZfrG2MnGOJndV7lmFqcOI8tHXGYMTs
	 n4YzCG1gauMT6KUV5cFnZFlv0htkdqmjM7CQPScg2DmZ1w1INYRTWVLAxoXFWgG7JuiCu
	 xRkGTE6SKSdMjYPUrBOSsYrdhwMoIbhcm5kxzTjiDCaSniMKfzdEQz6Oegeur6vbmeP80
	 DRH9Fzc0uwFDAmgDhhVNwHO0J8pkqs6bUKFogEqYVEF+oNlSGRdV3JXTm+U4b/vlrDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795829080;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hXkDVuAr9qA224/tgLfxZAkp54fhq25Xt/MuC3ZvONk=;
	b=YS//UPdfqS0GO9JBec7HADhfxfdew6fJqIvDH0IE35MGtvN8WKKnNOw2qz5KK59CwJVe
	 MOlDts3/6c6j66ypf73ZbuPxDuz33TgNJa+UsM9ZifCJQYTAQNtp53XE3EsM3rmWk8bco
	 6zQRnQ1B9OMUS0ia8HUEzhvQNOTmo25cEi0XaEFN/mHGxKo2qUEEGoKxBWezO2ABK1GVH
	 9nftsmiv+qIkPuVVMUwEzOGCJhVyd9jOpBPmJLiMID70zQfPCPtCLyDeqaUek9n3OxLlm
	 dSozQ8JwzReZEQNoBiAiN4YC72kXqAbx3Qn0+/JP91/maEKhxUtXqmyUVIzoRvidmyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ld1gFwTL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83189606A31C;
	Sat, 28 Nov 2026 01:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ld1gFwTL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795829080;
	b=qPVUF+LC05Xe4XkAbOhGzjBeBf/XtVIHukzt4Xw7v9EyEWYj19mAL99lJ4HM7qj1Fuht
	 3HdjX+jbXrU1AuuDQqagyInsycvtdizAD8lpWQvq54WoIkbEEVdxWmpJxIOxEYk2d7v+g
	 KFYcbdCg0UrtgSYhTuFPWKLWWyPj7ZfXWiGUVdaaeSaisogo5cd6+CObr72s6tghPpN8+
	 M81zDIRbaJloWotnvdSuBrcQwlaR8cUjil12fSQXmzubI/zjkojQLcEov7NACNuQxjc8f
	 znWVfiGX+nB0/S+DOuJ5mJO2zZlydYOOD0x6UskEXcrkl7rjg7lkKlxW5MdFu4uXYtg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795829080;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hXkDVuAr9qA224/tgLfxZAkp54fhq25Xt/MuC3ZvONk=;
	b=j4Agak9L2F5nfvYCgRhrg8k+qFlSUsev1AGS6UtMYFU5DpRSLIyZBzP8YtiZZJjCxHOi
	 AJfx2496YNoOtrzIkZSyzb8tXkEbopwP9Wlkmc5gb9XU30RNTTC4mlCOOP4nvRO2eX61I
	 IfN6l8/3MTxo0alf0SmUBF8T8L6fjMwwGPi6HOI2nkqI5+/jS6eSRmI6qm2B7M2PCVab5
	 +YN4HKOYE2Az+MNhMu5Jlx0sSSmRiunMb2wqMF30ejpvT5MOgdVICzBPk5FLQqmxgr4X+
	 qjBNxs/cdNicsLDTNQW49cqrQWgsOfOErVCr+coXAMExh9/SuhDBxSvUIkn+mvuoI1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B79031F000C1;
	Sat, 28 Nov 2026 01:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795829080;
	bh=hXkDVuAr9qA224/tgLfxZAkp54fhq25Xt/MuC3ZvONk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Ld1gFwTLygpNhJGL/S4tCL5j8T6dKiSU85IUiXCSHHGt478lD6ZH4fyW5FqtO9/XR
	 eeu//WkyWnRNCEmarWiKSZbbuTmkWfaBdLc6gZM3wp5Vx84grblRcMKQ2zuM5jWdtH
	 5ybcfK5dqdfF+GExbKJjcXiZumFhrMxOi27kEM2aCwciwptwWqh4/agb2abpETp3tu
	 SbjOfYjzC6YXqUDCi8LyA/P6a1nKxeuSaX7vj5btei5rXsDZ4DOzfAIruqAmKQu24x
	 aO2xIXvQA2NcB+PRzwlXmxkWeLovTU3/k432XnnaXZ3kdJQc8RIFMGjiohW23GBCEa
	 34ZT5u1JXqwLg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 345D74DEF4;
	Sat, 28 Nov 2026 01:24:39 +0000 (UTC)
From: Silvio Unkovic via B4 Relay <devnull+silvio.unkovic.pm.me@kernel.org>
Date: Sat, 28 Nov 2026 02:24:29 +0100
Subject: [PATCH] media: gspca: ov534: Relabel the 137 fps QVGA mode as 143
 fps
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
Message-Id: <20261128-pseye-ov534-v1-1-a71e4661d994@pm.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyML3YLi1MpU3fwyU2MTXYNEs5SURGPzxERLYyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgBGSfMvbwAAAA==
X-Change-ID: 20261128-pseye-ov534-0a6dda37aa93
To: Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Silvio Unkovic <silvio.unkovic@pm.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795829078; l=3137;
 i=silvio.unkovic@pm.me; s=20261128; h=from:subject:message-id;
 bh=8fULFlrKgnlUMHAfhORSxpngQfJXvNB/Ft2M6SHjW8A=;
 b=o4SsLptTWwuz1h/BEDYhy/x32HByRpK63H8pC0OsR9Gs21cPx1UEFR5pIwZyfQ77zSSkqPVSW
 apN0Zshs4RgB2by3nGhTwEWS4K0EDPff/LsqJfZeMDKrz1IsZaI6ufr
X-Developer-Key: i=silvio.unkovic@pm.me; a=ed25519;
 pk=EnRsDjntfFouyIMyaboNgoB+wQ65iMW873YmPIjPiII=
X-Endpoint-Received: by B4 Relay for silvio.unkovic@pm.me/20261128 with
 auth_id=1673
X-Original-From: Silvio Unkovic <silvio.unkovic@pm.me>
Reply-To: silvio.unkovic@pm.me
Content-Transfer-Encoding: 7bit

From: Silvio Unkovic <silvio.unkovic@pm.me>

The OV772x QVGA rate table has an entry labelled 137 fps using the
register values r11=0x02, r0d=0xc1, re5=0x02.  On a PlayStation Eye
(1415:2000) this setting delivers about 143 fps: 143.27 fps measured
shortly after plugging in, drifting down to about 141.3 fps as the
camera warms up.  All other entries in both tables deliver their
labelled rate to within 0.1% and do not drift.

No combination of the three registers used by the table gives 137 fps,
so relabel the entry with the rate it really produces.  The images in
this mode are valid.

Note that set_frame_rate() selects the highest entry not above the
requested rate, so a request for exactly 137 fps now selects 125 fps
instead of this mode.

Assisted-by: Claude:claude-fable-5-2
Signed-off-by: Silvio Unkovic <silvio.unkovic@pm.me>
---
Tested on a PlayStation Eye (1415:2000, bcdDevice 2.00, sensor OV772x)
on 7.3.4 with ov534 rebuilt with this patch.  Rates were measured with
"v4l2-ctl --stream-mmap" in YUYV:

  label  measured        label  measured
  187    187.34          75     74.93
  150    149.87          60     59.95
  137    143.27..141.3   50     49.96
  125    124.89          37     37.47
  100    99.91           30     29.97

With the patch VIDIOC_ENUM_FRAMEINTERVALS lists 143 instead of 137 and
the other modes are unchanged.  This mode uses the same r0d/re5 pair as
the commented-out 205 fps entry, and it is the only one whose rate
drifts, so its clock may not be locked; I have not confirmed that.
Dropping the entry instead would also be fine with me.

Tool use: an AI coding assistant (Claude Code) did the measurements and
the analysis of the rate table, wrote the patch and drafted this
changelog, working on my machine with the camera attached.  I loaded
the modules, and reviewed the change and the results.
---
 drivers/media/usb/gspca/ov534.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/ov534.c b/drivers/media/usb/gspca/ov534.c
index bdff64a29..5b7bd1922 100644
--- a/drivers/media/usb/gspca/ov534.c
+++ b/drivers/media/usb/gspca/ov534.c
@@ -116,7 +116,7 @@ static const struct v4l2_pix_format ov767x_mode[] = {
 		.colorspace = V4L2_COLORSPACE_JPEG},
 };
 
-static const u8 qvga_rates[] = {187, 150, 137, 125, 100, 75, 60, 50, 37, 30};
+static const u8 qvga_rates[] = {187, 150, 143, 125, 100, 75, 60, 50, 37, 30};
 static const u8 vga_rates[] = {60, 50, 40, 30, 15};
 
 static const struct framerates ov772x_framerates[] = {
@@ -828,7 +828,7 @@ static void set_frame_rate(struct gspca_dev *gspca_dev)
 /*		{205, 0x01, 0xc1, 0x02},  * 205 FPS: video is partly corrupt */
 		{187, 0x01, 0x81, 0x02}, /* 187 FPS or below: video is valid */
 		{150, 0x01, 0xc1, 0x04},
-		{137, 0x02, 0xc1, 0x02},
+		{143, 0x02, 0xc1, 0x02}, /* measured 141-143 FPS, not crystal-stable */
 		{125, 0x02, 0x81, 0x02},
 		{100, 0x02, 0xc1, 0x04},
 		{75, 0x03, 0xc1, 0x04},

---
base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
change-id: 20261128-pseye-ov534-0a6dda37aa93

Best regards,
--  
Silvio Unkovic <silvio.unkovic@pm.me>


