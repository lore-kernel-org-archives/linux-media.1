Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794010732;
	b=IqL2VxIuxq6VgAtDQ+SzpzQOPgTydiVE6j1VGg0e3BQLwvfqSv8WCO4E6lIw8C7EJaEd
	 YRcltYrqmPDxJmQe8413W6U2BRW7oz2XL0fUaBo6iVuPunMihQWOVAoAL221xqVxhIsjx
	 6JTHar1uVjwfyb10+LjNTPCMg10gIJgir4CF+Ji2cZwSLaBdd0k3F5LF6YZWo6TTX7qHF
	 2dbXwA3TEaCOJ1Ell5GcdtaU0DG792uvZfpkum6pQ19mv1Y0D+ykA421yLhdaJNox49wc
	 FYOmeYM0bnbpE2TtHglnlHX+TIsJIGeAFRMdXFtj1Do+kdV8PBzQBcJs1UG3PubcrTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794010732;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ErxVFob8NVBa8wQUtDLP+IjPTrx/b6Ac6bmO5if6hHw=;
	b=2do2ksvL30KswU37Ms6akhsJyn1LrCVFigq6iiZcwW0rjEtDcQslE6hVRaZfafkTaJqe
	 NxHPh4nIoZbgRxL07KvIiAWgVmu6hP7EdiOeKD5z+YtBnnQ/XNCmgva51OGxK4j+JeIhm
	 H86xiaLASFuwNfZb/1ALt+dDJfP7keGBs9R5EyiCeN5/bWA0E2rA3eO0R/vBqilNGGmi7
	 YZvtWRw4FzhCnbgJTPeEDREpUUIpgPuT44l8Jj0ZeYvHKRranc9hADAzz3XcyfeFplQ6W
	 8NmPN74E0OoSUzJkeJ0FB7IPe51aard2tQb6eY1ChSyVwSA0zx7WQMu8umTPGxLCrtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gQpVlCZC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kB9LTx4F;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C30606A326
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 00:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C30606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gQpVlCZC;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kB9LTx4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794010729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ErxVFob8NVBa8wQUtDLP+IjPTrx/b6Ac6bmO5if6hHw=;
	b=gQpVlCZCWXb2a/1cAYEEDo2vroggKQuYSjYUPAhZc+pZ/voesYQ6uSb1cRBSPsdsCcujoN
	oZypbCRcX8ExdWDVPCw3asss3hH3y6AcA49s3HtHQ8sZS0l7N227zXoV9LIdGd6wR8bhLY
	f/xrp1759tljXcZjG/sLur1I0cmZKv8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-cL7glSQcPo-BLTIMkF1UmQ-1; Fri, 06 Nov 2026 19:18:48 -0500
X-MC-Unique: cL7glSQcPo-BLTIMkF1UmQ-1
X-Mimecast-MFC-AGG-ID: cL7glSQcPo-BLTIMkF1UmQ_1794010728
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5363b06bcb2so23407391cf.2
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 16:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794010728; x=1794615528; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ErxVFob8NVBa8wQUtDLP+IjPTrx/b6Ac6bmO5if6hHw=;
        b=kB9LTx4FRvjlg0Fjh86oAu1WuAO/voVb2Yn+sBAd938lMJgh5geHsJQ4Lb+TvTebC4
         rN8skt/MuzbTdkjrnbCla98F15NvZglEU4vBKapPYWkQ+JIde1dN6gNb4xK4EKC3fYeA
         16UmFJ8gFAb9C8y2jSEtqhRo5kaO9xMtjJPuIyRY09XBzl5ZSUeb6hAFkqMPWZBK8Gtp
         sI8LaAPTBsOQFKrC3oXbsdkfSETsQuNejC+cNRsqu7VDbZi+nYYirMjlY53f+mgYX1RM
         1Na96HZqFUgLghIGooTBHkkBGjr/HYhSg5W2UtLUa9emBiG820993ubDxaZeSPWNEAPs
         YxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794010728; x=1794615528;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ErxVFob8NVBa8wQUtDLP+IjPTrx/b6Ac6bmO5if6hHw=;
        b=tswp6ortgsgsQt4+8dWXOqLOcVXs4NCPN16xUvYv+B2D8iexfKQ8mA1mQgqn/eqNCA
         fQ4Ig/hAfzRvZqrEbz5g+VCF0y3nVlA7izSa0lj3xRGN1jX1FglmcNv/e8BHWQOsuFas
         CrNd5J3mG4UBjEPjTR/lrp/cX+kFbpPsjyX3P4IS0PAW+CzTaTddePRXWAzG5jA8tyhH
         Frr6DtM2qkeDcoPvTXQTc5WgaD9NfPRQ9u+iAYXA7G3ueGsGPami/pkeZEhQc0X5re4v
         kh1kqHLynAEyWASkV7SkMxWNw7NbWOeA6cJHjtIlh4/Ki0y5EFFV6MOYG8Ub19bbY5RB
         aBfg==
X-Gm-Message-State: APuU4Z9P1cmwG1MS69eaDB6KfaMV4qxEKFcdln5Z4PPa7a5lOhJ8ePsE
	0t9YCwkwa0qHa40LsBs8vLFJUCQ/LD1ocFZlWTBYVvRuMCwNcmhk51f+Ft1wOUS9tS/7r/oJk85
	EELN5zXrPMXH3fEA0oeAPL+HWE9u4WEUeyECpFtqUtHgflDsS2RYw7aGJ4sB1LUKBwu/gydHlhE
	4dqKFv/GeEklKZDja4T0/00nmj5LRR6BwIAmTODfEx4w3Tswg=
X-Gm-Gg: AYBFou3m9fLLJg0Jfeh9ZBtmBoEE3oLBJjk3G/AaWQ71fw1STxAh9v8u4Yk/EPx1UVv
	Hy4BxwhW1PckdHq/+aVai3Re04aA9SIjPj9FvxYDFrjwoLiWbK2JHCjGfPUVUQdlEAnFKp7XIaG
	ZxRfPZuC1fRadcOnIFXzpn6HFPYVUDT+Hri/lwMAI6X1ET4a/krbHBSd7blsrqrf6+HjaxZGXPx
	wRhsu7Y4S3qyIepEhr6sWZBeIlet+qs2WTm4iM75Ljam3FBqC7KltAbDMBZ6IUG4hxsj9w0N0EK
	TjDZawRYoMcFVGjRpa5jkPOsBkfQAx8ou8sLhaY3+4qnfCHf5E2qfURQ9Et99MvPoaz9njEcbNh
	n4oFM9Eg2Korlc4un90/JA2nkfEg4r0pcesUle+GqWSgd/jzelH/VfWbhDQJWNjv8avvs6td7/d
	7V4L3zVP6jec+728jk
X-Received: by 2002:a05:622a:1b22:b0:535:232f:ca25 with SMTP id d75a77b69052e-54e100e583emr65111411cf.7.1794010727775;
        Fri, 06 Nov 2026 16:18:47 -0800 (PST)
X-Received: by 2002:a05:622a:1b22:b0:535:232f:ca25 with SMTP id d75a77b69052e-54e100e583emr65111031cf.7.1794010727151;
        Fri, 06 Nov 2026 16:18:47 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e26b27a45sm32610361cf.22.2026.11.06.16.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:18:45 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:18:35 -0500
Subject: [PATCH] media: davinci/vpif.c: convert to subsys_platform_driver()
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
Message-Id: <20261106-media-subsys-v1-1-0b5d3d5ca71a@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWtiKAuvIhbVDkbikg5CxLsrl
 l9yzn+BkGcSKKMLPO0sPE8BGEdgezN1pNgFQ5qkBWJSqJEcGyVbI6cohzkabfNM6wbCZfHU8vH
 lqvp3WA5k17cB9/0Ac22ngHAAAAA=
X-Change-ID: 20261106-media-subsys-d151a4c5344b
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=rU9J7t1ikbpEBkofPfFfsm/l3KTCXyS4+WAhXWeiVPQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe5SXMd5a/OKdu0o9XSx9+j5vc8YbteIdfkb3wmwf9N
 katy3Ofd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjAR6c+MDFv8cv/VGyr9kvlx
 t+rAyhvdhr8qJbfrTZ4ofnPS5yCHjwsZ/rszNIRNnLLnjk15owCXLPdhvQp/fdfqtilsUj8OMNV
 1MQMA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/platform/ti/davinci/vpif.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
index cc0b0b8cdb89..0deb91b7fb9d 100644
--- a/drivers/media/platform/ti/davinci/vpif.c
+++ b/drivers/media/platform/ti/davinci/vpif.c
@@ -595,15 +595,5 @@ static struct platform_driver vpif_driver = {
 	.probe = vpif_probe,
 };
 
-static void vpif_exit(void)
-{
-	platform_driver_unregister(&vpif_driver);
-}
-
-static int __init vpif_init(void)
-{
-	return platform_driver_register(&vpif_driver);
-}
-subsys_initcall(vpif_init);
-module_exit(vpif_exit);
+subsys_platform_driver(vpif_driver);
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-media-subsys-d151a4c5344b

Best regards,
--  
Brian Masney <bmasney@redhat.com>

