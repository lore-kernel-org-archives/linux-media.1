Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698578;
	b=2BEVaZDgabz23ih+mUncOXEuwuiSb0Vj2Zy3Z0tWdCW6IeCAFkIlVls+ZNcI4bezWYBn
	 eq+BL7koW9sG/U2xKihPKHifFmfC8Jljf80zPru7v7BpJUOuPE8PS1S8kvc1VNu9ZQkoe
	 sYY27uTwTYYbGyvPx52bOdd0Nf0eFVfLrdtNDG4Vt5XDYbxEqecp14tnmimWHgWh8jAg2
	 fFKpTvEiRSBWKrmmjY9ATF+m1Mun/5EBDX8Ad6ZqQFd+Ld2A9pXErttdEMNR3xP8ZTLUD
	 ALtnIQN9NUOetvJfpERs5QFqaZ9EftNkBYxuwYDM2e0sk8FVg+DId62jjE1ex0gVraA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tGnlBktFh5eVn0yoSJXVJDZQZm2aLj1/BTVa+INKrzo=;
	b=A+dB9mrOevZ4tFhZbTdf7a68VVgwuQCvyfG1+sMsYpPg5rdNT8f5iINlwSWOcfQ557CM
	 sTmz2J9H6ii0KgcDweSmVCU8yN4VzUYtHz6EWXtwKZXBJYCLvkvHFpCYE/WeVs85PclTs
	 VyLaGKJ89RWt/+MqHHuzEannNOznpVYgJKSwDFA6r8dKk0yvx6Rm6RhgkBS9f9VChwaNd
	 tj0NbpDk8m/Af76j+5CSGh7IYT+aF3QcpY2+5lmrkfSyQrBrUk0XvXB+BQIrZSEzpCqJN
	 egQRmvBYGoMa5kwFapkjNer5UOPTRDOymvia33fD08Do2gR0BzxoE9gxMUrBXVtbgVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vxdu6+V0;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F52606A322
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 19:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F52606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Vxdu6+V0
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso73684a12.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 12:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698577; x=1793303377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGnlBktFh5eVn0yoSJXVJDZQZm2aLj1/BTVa+INKrzo=;
        b=Vxdu6+V0vA+fYQQXhQwaqACCGwbPcpTPmutsisVoDUELNZD/LIwcGgGUfTJPW09cBf
         R9pAsA08sopxxSegk7pl6yGfEg5f5yR3a8AvAcgEo1EfeEUXmkgufrSkN/bUEdToZeBh
         PRSVq3p4Q8QuMX8kqizWyK/CPlrt6M8/x2/ZU2a5KuGBPaAh6DNkNMsFfqKrQoP/ZN41
         7Y9dXlld3x20OmdF/NzZ0Bemk0LKuPq5lG0Rf3SrHtPJ3JhTHaT7/jHB7g8TkYLG3HCj
         +dI3XMv5j40fd1sBKMAqojsqG+iWl+bMQBoVaut32oHmUQcPbED6gjKCxSzjgbeIM2jX
         ANEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698577; x=1793303377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGnlBktFh5eVn0yoSJXVJDZQZm2aLj1/BTVa+INKrzo=;
        b=HzLY3MavTYoTeNeKw5EQdj0R4TD8DoctxTGlkPACGrD79tZ9gTUeTAAUYq/dElootf
         oIit82Hbv6HAH+FtonLESjhxCfpy+tZoF6/XlwhkuSNUc2vKLO35vBhPCHOxirVxGPiB
         ohS+oAVMTaqF45u3e/PAa75WRXFWMi+tgyryrUzVqjXFDNvAPWoW/5hLveT8WeGWj7Hq
         vXOAKgOBW7WmKNPjvg6UrcmKrCsVhPTBkEzaeBLbhNy2hv62Vm4KDogFBHR0nSDNDrup
         XuMsEaaRELJbVQLk9Yz1sFFFB1QJsVMVeVyH0BJdDv3ZcgIPouq0bzIyKkxqXIWy+pOp
         qU2Q==
X-Gm-Message-State: AFq9FYIwiPIDeAOVxnwNeyyErKlorUdkrbYnjLNdBhT3IzY1iCIP7B8Z
	yRYArTvo16IaU42DUn2axD1Dr1koLftIgC3YyMhbas/Fhze1d2Oq5G26
X-Gm-Gg: AYBFou3OZMou/cVXcBrgGCp8WQgdsbXmNnfTpu3qD4X4+v6+QBeX5HvNjzkAOpTX0r+
	243yrMH/Zny+Cos9QtQTas7ZaNAdixawxQK/d1eY27siHRdQE4INAjsqC5mt872VcfALT4FQr80
	VWfEdXfcOmp82Q4pBZLm8uDgfCz4ArHAvi0G2/sPEBGOslEjPRpzT4Jes0pxNf9dFuCxOykBgzA
	e0spmpnpL3uN+qdGl00EEWe/QANkDJODcSv3KTRlnIH2dEo5P0cElG5cdLWzVkDopf8Te0pFJl8
	u8mnV2XsW87CKnz8JsJ7wKEiNLGCVAbfVvlzo5y8iz5NEAEMC3y06jpYCFbp42RjWRVfVnzrkrl
	hurNh8Qeu/LZNq0Lk6NCajSzR15j1upc3KGuiUaYKkIYu8ZjuHjCrQIGs/Pq0cJaCmcokVvYLze
	smh8QwawPaytN3JE1BhXoWaY9JHCxt3BEFUaptIErDlRkwAfsGLpDN5Ro6CIpIrU06MoyKE3A+f
	ufUNBzwj9sK+hjA+x+LrWHNIHUGDH/esg8Qd0z7/UFP03mg/BpX5/AV0tQCfQasuh7Q7iaesmOD
	1aARUSW2wWzM0ISS39sBt+0ZCt4HWMHf
X-Received: by 2002:a17:90b:510f:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3ada6c5450bmr1793240a91.8.1792698577022;
        Thu, 22 Oct 2026 12:49:37 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490d4bfsm6400293a91.10.2026.10.22.12.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:49:36 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Subject: [PATCH 3/3] media: em28xx: fix refcount underflow in em28xx_free_v4l2()
Date: Fri, 23 Oct 2026 02:49:00 +0700
Message-ID: <20261022194901.14302-3-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022194901.14302-1-neganhat@gmail.com>
References: <20261022194618.14170-1-neganhat@gmail.com>
 <20261022194901.14302-1-neganhat@gmail.com>
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

em28xx_free_v4l2() is registered as the v4l2_dev release callback, invoked
when v4l2_dev's reference count drops to zero.

Calling v4l2_device_unregister() from inside this callback causes an extra
call to v4l2_device_put() on a zero reference count, triggering a refcount_t
underflow (0 -> -1) and a kernel BUG in lib/refcount.c.

Fix this by removing v4l2_device_unregister() from em28xx_free_v4l2() and
calling it in em28xx_v4l2_fini() during teardown instead.

Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index d653341ffd16..45b62655ca3b 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2332,7 +2332,6 @@ static void em28xx_free_v4l2(struct v4l2_device *v4l2_dev)
 	struct em28xx *dev = v4l2->dev;
 
 	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
-	v4l2_device_unregister(v4l2_dev);
 	dev->v4l2 = NULL;
 	kfree(v4l2);
 	kref_put(&dev->ref, em28xx_free_device);
@@ -2462,7 +2461,7 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 	 * The em28xx_free_v4l2() release callback will be invoked once all
 	 * userspace file handles to the video device nodes are closed.
 	 */
-	v4l2_device_put(&v4l2->v4l2_dev);
+	v4l2_device_unregister(&v4l2->v4l2_dev);
 
 	return 0;
 }
-- 
2.55.0

