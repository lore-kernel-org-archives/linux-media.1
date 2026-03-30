Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E263BED6E;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865516; cv=none; b=axI5clqsH24YmwV4Sizq+QeNbtRkBqfyYZ8vzFoHmrLBhy34qxoporHA0ZB6v5T3HqxtjZNQ4VKvULvxFUFytdaUSNtpsKEVhXUL0bxozOHn0Qg7oHEuWrWYmNWrtEWEFPDgyx/2kj8uWZLQ+ESpLCJm9l30xM6VLSVqONE2Rvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865516; c=relaxed/simple;
	bh=4on6QHPozqnGQIG0eBs3EcvebQJWDyF4s4eHR6wrc/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7OzxB6os5ARR6GG5C5YElATckS2P7tny6nl5wBlxkALngPfnaQUtJ+NYHVfc+S215jV5/SjyDlU3adj6mq6Qgu/VfZn2plIkn2r2U/7gXzcgqYaM6a8CV7jpv6zEgg9cRZQuNrzO2eEJnboPsePGzHm+u6tnzkN6hUAcjpL/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyhDzL/K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyhDzL/K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD31C2BCB2;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774865516;
	bh=4on6QHPozqnGQIG0eBs3EcvebQJWDyF4s4eHR6wrc/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HyhDzL/KeXaCuhAY8ki8kQtd8oL6SdaR44FapaHdUpOnpI4DArqenLW6xF7HdeRCC
	 DFHoYkuGSXHVFRiZsCCUvAUDsCU4emIdrEtjROOyjXr5vvEFvVWhz8xB4gFhV2ScT+
	 mDPTwn0TbWwV6dfo5yFhZD3H/SMVAwKapJjbpzgvFmsHksOTKjqZynTu/eWMc1W0AQ
	 0s9hlrvGSOhaRGu8jB9I37sSEuwAptTuKK2V25PmG1Oi/ruG/icIu3zquilg18AHTm
	 /RCfopXUeV33Ik9jhFHys8+5u4+v55KQBVOPboY7/MnfhqTFyL/YcBBucPJ5gTkadF
	 fO8Rv/z5KnIng==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w79b8-00000006yvc-1K9C;
	Mon, 30 Mar 2026 12:11:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/6] media: si470x-usb: refactor endpoint lookup
Date: Mon, 30 Mar 2026 12:11:36 +0200
Message-ID: <20260330101141.1664143-2-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260330101141.1664143-1-johan@kernel.org>
References: <20260330101141.1664143-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the common USB helper for looking up interrupt-in endpoints instead
of open coding.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/radio/si470x/radio-si470x-usb.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-usb.c b/drivers/media/radio/si470x/radio-si470x-usb.c
index 318b5f6d4202..869b1e7e34b9 100644
--- a/drivers/media/radio/si470x/radio-si470x-usb.c
+++ b/drivers/media/radio/si470x/radio-si470x-usb.c
@@ -565,8 +565,7 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 {
 	struct si470x_device *radio;
 	struct usb_host_interface *iface_desc;
-	struct usb_endpoint_descriptor *endpoint;
-	int i, int_end_size, retval;
+	int int_end_size, retval;
 	unsigned char version_warning = 0;
 
 	/* private data allocation and initialization */
@@ -595,12 +594,8 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 	iface_desc = intf->cur_altsetting;
 
 	/* Set up interrupt endpoint information. */
-	for (i = 0; i < iface_desc->desc.bNumEndpoints; ++i) {
-		endpoint = &iface_desc->endpoint[i].desc;
-		if (usb_endpoint_is_int_in(endpoint))
-			radio->int_in_endpoint = endpoint;
-	}
-	if (!radio->int_in_endpoint) {
+	retval = usb_find_int_in_endpoint(iface_desc, &radio->int_in_endpoint);
+	if (retval) {
 		dev_info(&intf->dev, "could not find interrupt in endpoint\n");
 		retval = -EIO;
 		goto err_usbbuf;
-- 
2.52.0

