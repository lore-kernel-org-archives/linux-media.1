Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634310;
	b=WH8b+hsKPDxh67nkeUbvJvXyFRYCuSIyWkj1lr+az26TTKxPNbbmsAyyJsvbI0pY3Nlc
	 0nBg5Fkek4LQ8rkMfU5YbSJsTqzGGESBsiRiNvgfTpmuFLcY7jSubr6ZBtkjpM7gopLJ2
	 XyYyHxa+71k32218GVyhbR6mWWLC5RB5qPHNJIC9GACLhsIdb78jvaog6/dZlIT6KyYmR
	 HnFtdZSoQRcTapw04LIDLr0hloNoR6jqYt5pAHASXZTNpXxzsdRfiD13I39SihT2bcMJs
	 jWGKM4a6LSzm27ymCOuthGSjkLov/hEiDXwao/FEBLEIg3GsAaVY0NpZo/9NWqcx61g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G+Ul4wYB7F7GOHeOHYfi0XFFmYlVfK1p/QtFcQWKlB8=;
	b=bZro8OYGpp7AdpYbeyjnNaJWc9h0kWCxZTd4PGnAdpJk8u+nr7xzSLw5kspO7aEUMufw
	 DhapP204Z+y/ECb9JzLDy87zYAQxJjXYBSH2bPTFbs42vBQGn8eCNA1xSvlwCl4F5fnpV
	 ItoO9FO0JQ0Iwiw1Kn/0GLXmydnZ6D/eUU/kAQtpG+cPCe0PjkRn92+4dG4wfolrCIHw8
	 39UAZDvwyn54wL4gIH0vt2LsYmdPFcv/MieyYyQDz+ortko9z/1vUuXRvAvFO63RygDZq
	 6Ztj2kHLLQHV6NX5lNJxRXVmLvAy2a39Xs1jplnAtPIVz6+m3T+7+j4OG7NX9DH9ibA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOO+oafD;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBD9606DE8F
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DBD9606DE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jOO+oafD
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so23924965e9.0
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634307; x=1794239107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+Ul4wYB7F7GOHeOHYfi0XFFmYlVfK1p/QtFcQWKlB8=;
        b=jOO+oafDQ2vni9CZUtj423urEKRJ69jfP7P1rtCT/lLRYDjvDPw7FUFoXbbgyPo8Cn
         yt1Oy8naqRqTtH3YENpB/KwgK30dNfiycT12ytLnYPpQA/NKOZ7+zH9XwYEkbtFZA8pu
         PzdFUh2YdT3h094VfP2ntYWTCzRKfIiB//63Arvj88EkMwFfT+eONgMw6ezvUPafMq4W
         /x+wSF+8Wt4Vrq7+dGVFU6mzMu7ZRjPOjH/4lXWmJVjTVU04IEkrGL33E6/Vh2NMWgzu
         cm7A711XcMoQEQf7wAxa+nuf3xplO/L2OK0TCcjTAm0u0in5AiXnE8ypOWmvIUKr888X
         GPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634307; x=1794239107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+Ul4wYB7F7GOHeOHYfi0XFFmYlVfK1p/QtFcQWKlB8=;
        b=HcTosLnht8Hthw5Ue2jwQY6wmhglx+ZtJKg2VzBoLK4Pcsk1j78NVVAvv0OthCDFdV
         Obt1ACaXwA7XSZlGywp9FYeIGFU5+ruWzSVjLqyeip/zRWH0bSAV44o0JQExtI7CcsMR
         E2hZ4BgzOiBLoWt8zc31HnA8PbM4rrUpWsma4odegube71maK4P0GiAhg7EmPrBXTMeP
         PsBFHODgIJKO3QT1gCT/1iJudv4yrP7EIGgHvkeW+OZzzmNq0vaCAGvTI2tidJ7jtcGO
         4VlCugJNbzLqmVsEnQ8pV2TLvN3G4Ubs0Gk8LgKPWf+1BSINIY0sZPZTCeQMOyM6ofaN
         pVRg==
X-Forwarded-Encrypted: i=1; AKwUvBy6bqC0eAPG+6KOPlAiROEyEyKFEnbFlXFQveLbw1wudoHmHv4Qh6mYclOkiK7olfD8yn9YhwIccNbX7w==@vger.kernel.org
X-Gm-Message-State: AFq9FYImqQsFG9HQLl7sbRQBCDVFFuqqcil5eyBTbZFfGJ1E7CfROn5/
	c8NvmkWKTbEiJvpNUw4Bw5yjpHvqvltk/t9ox26jJjGqD08M2V3zBGU=
X-Gm-Gg: AYBFou3bfJ2Kt7xOIB04nM6YnwP2Ul2QX2msSQ4cYWqHOH5qnt7pFbFoUZpZpVGuDSK
	AlZ19sW9TBEDAfx60LVPEmUos3zN5NLaD8OIb9S19HtqAfpdKvEqe77YcP3hVel6mrS8SkKl65g
	XEp3iAJa97nMjby0D24cor2mknXoYizsctb/ir8WL+PorKXD/E/VCeDzy6aQC4MYuRWdndh1bAi
	MSXTBkQKquzfgmsEW8sSPsuZ1a32Q3csCFER+5cIXGT6M8w1HKyYA6oIEBGGDvnCKKotPlrjz1z
	/RfuncgMy4pHRTyb9EVyTnUaFV4P5CYVmkXZC+dxeVR7P61cltEXh0ilejxqn8liIm3JVY0TCUk
	rY7XpmAkQWmCzrvqQYd88Dvj6CRGh8lVlcd5Dkurm/m+QHEUex0kgJXUuKkcqmzOeYfs/YFVPMC
	wxa87yN8ZCHCW1kBt6o21Rs+OByf8W4wFIRYHFBwVXllOpp0XSgWNCEfmfvK7xrqKEroC6cSrJz
	U295HMjeZy0tZ21DGCYGm9//QcrUwME59n4yJsCveehVtRL+kyl+DmkD8MGF1OX4d+3ubh463jL
	7NsLNrS9E+Goa16WtjW6XbtTpvJiLXTy
X-Received: by 2002:a05:600c:8b04:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4ac150b2044mr235626945e9.2.1793634307242;
        Mon, 02 Nov 2026 07:45:07 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm369026565e9.9.2026.11.02.07.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:45:06 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: mchehab@kernel.org
Cc: linma@zju.edu.cn,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] media: dvbdev: fix dangling minor pointer in dvb_register_device() error paths
Date: Mon,  2 Nov 2026 15:45:05 +0000
Message-ID: <20261102154505.1224791-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

dvb_register_device() stores the dvb_device in the global dvb_minors[]
array via dvb_device_get() and releases minor_rwsem before calling
dvb_register_media_device() and device_create(). If either of these
fails, the error paths call kfree() on dvbdev without clearing the
dvb_minors[minor] entry and without going through dvb_device_put().
This leaves a stale pointer in the array that dvb_device_open() can
dereference under minor_rwsem, and bypasses the reference count
established by dvb_device_get().

Fix both error paths by:

1. Clearing dvb_minors[minor] under minor_rwsem and calling
   dvb_device_put() to release the array reference.
2. Replacing the direct kfree() with dvb_device_put() to release
   the initial reference and allow the release callback to free
   the object when the count reaches zero.

This mirrors the cleanup sequence in dvb_unregister_device().

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/media/dvb-core/dvbdev.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d329502a6..c931c467d4c52 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -551,6 +551,10 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (ret) {
 		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
 		       __func__);
+		down_write(&minor_rwsem);
+		dvb_minors[minor] = NULL;
+		dvb_device_put(dvbdev);
+		up_write(&minor_rwsem);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);
@@ -558,7 +562,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
+		dvb_device_put(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
 		return ret;
@@ -570,6 +574,10 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (IS_ERR(clsdev)) {
 		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
 		       __func__, adap->num, dnames[type], id, clsdev);
+		down_write(&minor_rwsem);
+		dvb_minors[minor] = NULL;
+		dvb_device_put(dvbdev);
+		up_write(&minor_rwsem);
 		if (new_node) {
 			list_del(&new_node->list_head);
 			kfree(dvbdevfops);
@@ -577,7 +585,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
+		dvb_device_put(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
 		return PTR_ERR(clsdev);
-- 
2.47.3

