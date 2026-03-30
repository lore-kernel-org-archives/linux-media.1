Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F8D3BED6F;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865516; cv=none; b=i/eqPJn4xSMtIGkWYWsgUJ5+56+n/KBExqYNHRNMRRsaRyLxf/qW4PpsUm8Etrnnj8j05g9OLRXiBFHyOe3QQpB0Op9ITEUtMBh8bCsL3y3Ud2dvkQ6kFKG1BBGoqjWFQLturGZdFVUBCainLwYV50Bdbx0HbyDKYdm2g9h4u+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865516; c=relaxed/simple;
	bh=Yzz9wzI7bTketJ/FTA9OXRo9U+Vt9chFVgyG0x7s0hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjjftBpfYlbylwsFEMH3Db2qYTMO00al2oa/iNZTFEp2hEgxuN7Tzlk02P8hqJ3wIQn7SVI2v5QSiiDY74oQ0nT98hnLpwYc3ve1bUSyKS6JpQNAkkzKfId5S8FMYP/bFuR/WrNFVjQZszgv7ieZWBx4WNUjC+d4ilFO2sXaZJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2nEVVMZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2nEVVMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DC3C2BCB8;
	Mon, 30 Mar 2026 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774865516;
	bh=Yzz9wzI7bTketJ/FTA9OXRo9U+Vt9chFVgyG0x7s0hY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J2nEVVMZ6qdy5Vf+WtqCyTXaykKtVzVZ+fUVjU+6KPdCp9peNYFkq515LZJGZYJ5/
	 /CqaB7TdXWldofmCAnL7epLNnJtN+R9Qi8zB2HNzOfWK7QclO4Uv+baAdfZ3ufDnHw
	 3Wg6jIdqmhEia2w/h1exe2J1ulZs2SxUcOKiAqnzRzZ30rmbmswaX0hx5GroqpxhLt
	 uGrOV/sdUk7yvdi0zpyXispRClqnocdng+Av4hQDEvjce++CCjRZ6pM+vBWEszcbiR
	 FVrcQz/8QHeW7WZ1/HjyZxHtRIp2/2io1g47tDPVfmqIVnvMhze49KrdR9iTG2FbeD
	 0H46b1sqZC90A==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w79b8-00000006yvi-1Qym;
	Mon, 30 Mar 2026 12:11:54 +0200
From: Johan Hovold <johan@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/6] media: gspca: refactor endpoint lookup
Date: Mon, 30 Mar 2026 12:11:39 +0200
Message-ID: <20260330101141.1664143-5-johan@kernel.org>
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
 drivers/media/usb/gspca/gspca.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspca.c
index 3fc15d16df8e..94f448819d84 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -208,22 +208,17 @@ static int alloc_and_submit_int_urb(struct gspca_dev *gspca_dev,
 static void gspca_input_create_urb(struct gspca_dev *gspca_dev)
 {
 	struct usb_interface *intf;
-	struct usb_host_interface *intf_desc;
 	struct usb_endpoint_descriptor *ep;
-	int i;
+	int ret;
 
 	if (gspca_dev->sd_desc->int_pkt_scan)  {
 		intf = usb_ifnum_to_if(gspca_dev->dev, gspca_dev->iface);
-		intf_desc = intf->cur_altsetting;
-		for (i = 0; i < intf_desc->desc.bNumEndpoints; i++) {
-			ep = &intf_desc->endpoint[i].desc;
-			if (usb_endpoint_dir_in(ep) &&
-			    usb_endpoint_xfer_int(ep)) {
 
-				alloc_and_submit_int_urb(gspca_dev, ep);
-				break;
-			}
-		}
+		ret = usb_find_int_in_endpoint(intf->cur_altsetting, &ep);
+		if (ret)
+			return;
+
+		alloc_and_submit_int_urb(gspca_dev, ep);
 	}
 }
 
-- 
2.52.0

