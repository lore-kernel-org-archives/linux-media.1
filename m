Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352958;
	b=a180yEgGgpIFEDkzxqSJcwWhxe0hE+r/uG5UF8hAj+q1uBBf7Orj9tN8i9huIODDpk35
	 seTM+vYXGvSs7unzMybSMck7+sqnRrwZ3BFWquWlhcf+r6c72xIq2ngVr8spN4hk+ZoDE
	 mEb/two7n4dbjU5uRPgZXiBnfkQ8Er2Xc4qd/3VB5+iL8gHyGabmeZHbewgxYd5Yqslzw
	 AjtJe+sWXfaSv6FINSBFxaNeDV0Daqc10YwotDV1kKReKNiRvx6UNVLtqQSTpwJ/gRkfr
	 YC5bAutpfuMF81SvhJ4Sb2meTdMy087PaPOElizs56EJwUExJsE/DcVREEvKodLZ+3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352958;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dyD7X8fCcfZku3eC0dXJc13RWeYF8YcbIed2DQVEYXA=;
	b=Zoc0gVyFVwVZd9M6M3ZeGlGYp9AryFQiidY09aWsEipKYrCUTcDkhzW/6tG8SoPDkv8i
	 JKpvJsepcXQ7znM/sLlKkAk5YZ2Xaav6xm6faJtqP0JP+4d7cGWcHLcaU8J0efhmvZzbf
	 y0vn7KhpIXzIGeHSH/Br0O9Ch7VJtbftfh5uuaW6qlvYnmTHT4unLzSWjU/2EqCBvKUIA
	 TaR/TaMy2w2a/YMHlybnpU/bQdR9zlSu1Q8AAi48bYv+5l6n/CQTK79wT3TXpoKq5QEee
	 7+siFZUC6JfBy3/+Gz3+BOyWi0wMgVYF6zIoYaFsNU1mqbijFK6EpIvEkllJUnJsjhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=d1UIJBPn;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A03606A31A
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84A03606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=d1UIJBPn
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2037063C;
	Fri, 30 Oct 2026 10:33:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793352820;
	bh=aoHhXISVfuioZiU898IRFObk/NEnUVBi3WZ3J3S4byQ=;
	h=From:To:Cc:Subject:Date:From;
	b=d1UIJBPnGwa7dwuqhje+wlzJ17p5/FyCEbdWTch9yOq6oYJbDgt6VTF+y3feUZ0CL
	 iGiMyAmngGLmiBG3sfzYoP3sGXU/WKgK4Stv0qM7EsihwfE6C/d/M5zpEMyHyJPOm8
	 ygyt9oJN4QJhedRH6yLEu0YUtyK6LQIvvqDF49NA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH] media: i2c: thp7312: Fix maximum value of FOCUS_ABSOLUTE control
Date: Fri, 30 Oct 2026 11:35:52 +0200
Message-ID: <20261030093552.3030999-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The thp7312 driver uses the value of the V4L2_CID_FOCUS_ABSOLUTE integer
control to index the thp7312_focus_values array. The control is created
with an incorrect maximum value that can cause an off-by-one read after
the last array element. Fix it.

Fixes: 7a52ab415b43 ("media: i2c: Add driver for THine THP7312")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/thp7312.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index f1c7f149c06c..e6bb790dd988 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -1266,8 +1266,8 @@ static int thp7312_init_controls(struct thp7312_device *thp7312)
 					  0, 1, 1, 1);
 		thp7312->focus_absolute =
 			v4l2_ctrl_new_std(hdl, &thp7312_ctrl_ops,
-					  V4L2_CID_FOCUS_ABSOLUTE,
-					  0, ARRAY_SIZE(thp7312_focus_values),
+					  V4L2_CID_FOCUS_ABSOLUTE, 0,
+					  ARRAY_SIZE(thp7312_focus_values) - 1,
 					  1, 0);
 		thp7312->focus_method =
 			v4l2_ctrl_new_custom(hdl, af_method, NULL);

base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
Regards,

Laurent Pinchart

