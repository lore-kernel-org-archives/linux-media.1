Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324401;
	b=0pHzYRJ23WMZ7xFgXn9FiFgh1RYUuWeYh+794zZTOY/32gj723BQhUrWQ24VlEIrrBiL
	 amKcY3P48brC5Ctz6ZknRRTbOZDOsNDiUt5G4RTi52kE8/C4a7LFpqe7wiiAMA+5mwOd2
	 mkWpEvmYhGf26FfOhUPHx51fSkzvF1Z58c4kTJN/Uh54Sfbu++x9iow2E30/mNp2vMV5v
	 Ws1xT8+MmcbPNdJVNQvGXVNlTjI221nKQaP/eXiEoH9j1qy+xdvkyvvCi8/ge+dM4CMGJ
	 sG8T+sgYDk8d6X4OVLkBnlKVMM2pWc3h1LtrZ5HbJrTdQqMx22yqWcCezn9B/Bf28Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324401;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=bDf7SaXXZN4Bj/kAPPt2M+ftmRFAu5u0Yw49fk6nP6Y=;
	b=zdYZu8G5cA9UiugJqmaCX6zvZkzpovK6b2oFccNz+jeB6mdsby2NC6PKyALPe4LLbxwl
	 53psBUteFkcjaMC+X/6tvQwHAwmD4LD0iIo9xF94qSFSzHjALq74prce0IowErgdfnDy8
	 L8LHgPsyFWKeHTN5VVf+fmNEfvne4xEfX6+u8Iq2ZzCbvYSYhe4kCwfdbUwIdv8hfuCBS
	 PEJRQ2CeXMx1ichFOIFYbljwTkiQ7sNlAPAsdreM2OXqIxgqf5VxDyLTq158SQu4cRK1i
	 DGQB8ayFHM8Z7HkP0uoBlsZGJy7DXPV8TnmNOINJfoe28/dWVMmu4PAAEx6unb6QT6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IOIIfaG/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E776A606A320;
	Sun, 22 Nov 2026 05:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IOIIfaG/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324400;
	b=medm7ajO6Hge+UZlD6aUTqzA/D7dwCRShiYsceDaqulzq/z6jMiMlzf9IUTER2+rZqrO
	 eIDw+Mv2+MmTL1heDzuosSgnUi3kCm/B3nhcqGhpxMRMklShsiuZZeayfe9PJGkgnqjOl
	 hISvQBTsLHT89lanD73M1pZxRbOZX6Nbqg9D0sjeCv8zWW0ye3xt3cfrBiDOjXTPaIMMw
	 PTke/rMNgpTC+dpZsjFgO53uCeqJyR7mjSBUAJL7XTIvWVvWzBrHaRsc+B0HYi86oOShA
	 Kp/6jHFZQH6NhKhWWGlDd2HAJ+NrVW1LYNNdMzsTjtqouVGmgTGHV749XGMuvL15Bpw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324400;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=bDf7SaXXZN4Bj/kAPPt2M+ftmRFAu5u0Yw49fk6nP6Y=;
	b=LnMBIbC1Efu3a+sT9CZz4HgJZ+srnyws8+nxGw+I4WRCuk4IdUlILegLoMdZO2zQwRCz
	 MsM5OWPuQVZQuWbLMT2J3OfSFv042MF63r+ZeokIwBlp5bedSw5ugl0CVUou6+A35C5rx
	 JZABXklsoYzMGQnzRUE0cY1EsEAa44SAQIygUwleXXArZwiBBAkz8U1E4yfq+nWOC5Ffr
	 k1DqTyEPB/9fBvWNo2A83baNajXXcj+40izEjZBw0MXYceTV4hwFPghn9S314NN6BpyIH
	 tDWquNzK6trEeBDIfvrwIgWUvopc7VGkaZY5K2kR2bOLL/gjTzgillVLtfnYrojZu9w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 070291F000C4;
	Sun, 22 Nov 2026 05:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324400;
	bh=bDf7SaXXZN4Bj/kAPPt2M+ftmRFAu5u0Yw49fk6nP6Y=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=IOIIfaG/m64o8WnC3cezw19w3lTrSjsvSUYFV2qxyJ3gG4yvdlUzOb5t8vofGPkHG
	 gWadKhcx3GTq3w7qpRnJZFQF7tCXlDprbrQAb2JVsDOXzrSPKSxvgJkc+6rpdFGs+v
	 4dGlBS+8IxfFYh+bxDw1yVkybvR6/ZyG2fKkDdmjhtejVT4vW529NjoRQFVeRl5Iq0
	 edtVyPbOU/MmXVY24D75AtSKA5eLVDV4F7vjlMCSHMIG4sSxEZwrO2WODH2InNI6d/
	 cDNEjUDKFdyvBVZEJ2hmJqzGhfLci9fXMujSlM7NG8L8mVh5Icfwt79lfA539Vjb0F
	 pz4lOzvjf1vVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8BF8F4BF37;
	Sun, 22 Nov 2026 05:13:19 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Subject: [PATCH 0/2] media: venus: Fix end-of-stream and seeks on SDM845
Date: Sun, 22 Nov 2026 05:13:15 +0000
Message-Id: <20261122-b4-venus-eos-seek-v1-0-2e38912c7cf9@enser.io>
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
X-B4-Tracking: v=1; b=H4sIAOt5AmsC/yXMzQrCMBAE4Fcpe3bVhKqtryIe8jO1UUhL1gah9
 N1N9PgNM7OSIAUIXZuVEnKQMMUCtWvIjSY+wMEXkz7qs1Jas205Iy7CmIQFeLHHoHvVo+v8icp
 uThjC5/d5u/8ti33CvetRbVgjYJtMdGONKg/5sm85OU3b9gXw/SnqlQAAAA==
X-Change-ID: 20261122-b4-venus-eos-seek-def2919e88d5
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324396; l=1979;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=iP7FYS+EUWbdvN2tGSghCLya/Epnwo8AlsueNNlxKd8=;
 b=3SJ4nGg5MO7AHbPM4HnJT6atKVij5aE02Xdb7Kp/IFJ/qkQAXViTsx23qxP2PSXXLHUolhcAl
 AUeItdKTwrcAp2HQV90Me3jveKK77HQ/9l00Y2+DYUs+G+hiUZklaH7
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io

Two fixes for the Venus decoder and encoder, found on a OnePlus 6T
(SDM845, firmware VIDEO.VE.5.2-00050-PROD-1) while using it from
GStreamer, ffmpeg and mpv.

Patch 1 gives the end-of-stream buffer that the STOP commands queue a
real, mapped address instead of the made-up 0xdeadb000. This firmware
rejects the made-up address, which leaves the encoder unusable until
reboot and decoder clients draining forever.

Patch 2 makes a CAPTURE STREAMON issued while OUTPUT is stopped for a
seek take effect when OUTPUT restarts. That is the order GStreamer uses
for every flushing seek, and without it the seek never completes.

Both were tested on the phone with the postmarketOS sdm845 kernel
(6.18). On v7.4-rc2 the driver builds with W=1 and no warnings.

Both also ran on v7.4-rc3: three encodes drained by V4L2_ENC_CMD_STOP
and decoded back (90 of 90 frames), and three flushing seeks through
GStreamer completed in 0.02 s each, with no venus errors.

One related problem is not addressed here: from 1280x720 up, the encoder
bitstream buffer is an eighth of the size used just below 720p, and
this firmware produces nothing with it. Fixing that properly needs the
firmware's own buffer requirement rather than a bigger guess, so it is
left for a separate change.

---
EMCP333 (2):
      media: venus: Signal end-of-stream with a mapped buffer
      media: venus: vdec: Resume CAPTURE restarted during a seek

 drivers/media/platform/qcom/venus/core.h    |  7 +++++
 drivers/media/platform/qcom/venus/helpers.c | 40 +++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h |  3 +++
 drivers/media/platform/qcom/venus/vdec.c    | 33 +++++++++++++++++++++---
 drivers/media/platform/qcom/venus/venc.c    |  7 ++++-
 5 files changed, 85 insertions(+), 5 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261122-b4-venus-eos-seek-def2919e88d5

Best regards,
--  
EMCP333 <emcp@enser.io>


