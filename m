Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC05EACD;
	Tue,  4 Aug 2026 04:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785818903; cv=none; b=IIJfolNqG2Vy05k9sWH9qTmJbyD7+Vex6Cu7ZZQ1laKjuUbPlwNeTXkW9w+e1MVE5WEaVEE+H3w6uxdaJ7R+knz5yuWMeUolHwZzC3UQUOBjr5kLXPRt3VBvtYvrOc8G53xl6qhdhGRRA+/Wo6XivNXIu8hdke9DMf0VeR2MGjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785818903; c=relaxed/simple;
	bh=oSBV/lUH5Pla6LciXLBF4FzFLGCgRDK5tRLVCj/lXNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aWqOR6q7kGGSQaJBDJrvpsMVV19SIj/rwHu8MsOvQcEwBo5FMYgFw9/8qc1ASjhL32dOJxIMxLZ8YmbWlQu6N6ADGndoXPQ/P95ip0KS4idQ9ffABIQpGw//LP7r2Ru8JyEZ6q/FJMrEPcRLGtiUiVcx6Jy6Kl9KoLv9GN5TI3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uq6BS0Ka; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uq6BS0Ka"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92485C2BCF5;
	Tue,  4 Aug 2026 04:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785818902;
	bh=oSBV/lUH5Pla6LciXLBF4FzFLGCgRDK5tRLVCj/lXNI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Uq6BS0KapaHyQ9wpWewtdL4gaJ8RDSC4eahB5VfdxpM8htCnD7AEnPxCdRvocRy0g
	 LWgJKkZN2826RVT4jHS6ZRiTm60B2PRkhahgRRqQE/9K2X1j4DsjswDRQSo4Yx5sBl
	 Z4c384TGfP2uuAuYMBGNHKWCti2z2XwQpKj0qP0rfXmR2+RMn+dqOzdz1KIi2pF8cw
	 M0ysVninYwJMVLB4DgtY6OozFqyZ/O3mclhOXArwNub1p0hFKc2xc5VK/qlG9sYPOi
	 Ho7cd7WqIA9lbv4MY2Q/IOCoBtRtW5q/UTFTnCsW2vPNl1t9AZ7ILXDsjUJJnSQgHf
	 PPY40L3UJ+PTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4A3C55172;
	Tue,  4 Aug 2026 04:48:22 +0000 (UTC)
From: Anuj Bolewar via B4 Relay <devnull+bolewara.gmail.com@kernel.org>
Date: Tue, 04 Aug 2026 10:18:21 +0530
Subject: [PATCH] media: hackrf: fix use-after-free in hackrf_alloc_urbs()
 error path
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-hackrf-alloc-urbs-double-free-v1-1-a2abe8e515a6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORvoNnXqr4iHJktdtaySWBHG/
 t2qx3d5C5hoFINTs4DKK1rMc0W7aYAnP18F41gNnev27uC2OHm+a0CfUmYsSoZjLpQEg4ogMw1
 tvzsO3BPU46ES4vv3ny9/W6Gb8PObwrp+AGoZBSyBAAAA
X-Change-ID: 20260804-hackrf-alloc-urbs-double-free-ccb713597c3b
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com, 
 Anuj Bolewar <bolewara@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785818900; l=2781;
 i=bolewara@gmail.com; s=20260802; h=from:subject:message-id;
 bh=JT0InAxsUZIh/vmY+n+CTvUVrKVu7SQ4wLCM7VeGKo4=;
 b=XiY+d/wENrzLn92spP5BswBntPYL2VQzW3SVgLkRMo8FkyT63swTQxoE58ModoJkXyoDqNoxw
 y1nTm0zTwKcDnV3krVSUaN4NcuWbBSP9vOcCKnUEfJAIipokhBIXDW4
X-Developer-Key: i=bolewara@gmail.com; a=ed25519;
 pk=XxcXxqFWk9xQziyNEfhS6NRJQR1shqHRRYzkbaYamm0=
X-Endpoint-Received: by B4 Relay for bolewara@gmail.com/20260802 with
 auth_id=907
X-Original-From: Anuj Bolewar <bolewara@gmail.com>
Reply-To: bolewara@gmail.com

From: Anuj Bolewar <bolewara@gmail.com>

hackrf_alloc_urbs() frees the URBs it allocated so far when one
allocation fails, but leaves the entries in dev->urb_list[] and
dev->urbs_initialized untouched. The caller, hackrf_start_streaming(),
then calls hackrf_free_urbs() on the error path, which walks
dev->urbs_initialized entries and calls usb_free_urb() a second time on
the already-freed URBs, causing a use-after-free (slab-use-after-free
Write in usb_free_urb()).

Drop the redundant cleanup loop inside hackrf_alloc_urbs() and let
hackrf_free_urbs(), which the caller already invokes on error, own the
cleanup of the successfully allocated URBs.

Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
Fixes: 969ec1f6bd92 ("[media] hackrf: HackRF SDR driver")
Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
---
syzbot reports a slab-use-after-free Write in usb_free_urb(), triggered
by an allocation failure (failslab) while opening the streaming queue of
the HackRF SDR driver.

hackrf_alloc_urbs() frees the URBs it allocated so far when one
allocation fails, but leaves the entries in dev->urb_list[] and
dev->urbs_initialized untouched. The caller, hackrf_start_streaming(),
then calls hackrf_free_urbs() on the error path, which walks
dev->urbs_initialized entries and calls usb_free_urb() a second time on
the already-freed URBs, causing a use-after-free.

Drop the redundant cleanup loop inside hackrf_alloc_urbs() and let
hackrf_free_urbs(), which the caller already invokes on error, own the
cleanup of the successfully allocated URBs.
---
 drivers/media/usb/hackrf/hackrf.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/hackrf/hackrf.c b/drivers/media/usb/hackrf/hackrf.c
index a15829a60e8..70fd95f3e97 100644
--- a/drivers/media/usb/hackrf/hackrf.c
+++ b/drivers/media/usb/hackrf/hackrf.c
@@ -665,7 +665,7 @@ static int hackrf_free_urbs(struct hackrf_dev *dev)
 
 static int hackrf_alloc_urbs(struct hackrf_dev *dev, bool rcv)
 {
-	int i, j;
+	int i;
 	unsigned int pipe;
 	usb_complete_t complete;
 
@@ -681,11 +681,8 @@ static int hackrf_alloc_urbs(struct hackrf_dev *dev, bool rcv)
 	for (i = 0; i < MAX_BULK_BUFS; i++) {
 		dev_dbg(dev->dev, "alloc urb=%d\n", i);
 		dev->urb_list[i] = usb_alloc_urb(0, GFP_KERNEL);
-		if (!dev->urb_list[i]) {
-			for (j = 0; j < i; j++)
-				usb_free_urb(dev->urb_list[j]);
+		if (!dev->urb_list[i])
 			return -ENOMEM;
-		}
 		usb_fill_bulk_urb(dev->urb_list[i],
 				dev->udev,
 				pipe,

---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260804-hackrf-alloc-urbs-double-free-ccb713597c3b

Best regards,
--  
Anuj Bolewar <bolewara@gmail.com>


