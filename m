Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794543673;
	b=ynRD21yRMLXfUrHMUA3vP3u7obhFtY46+esLGU4KRVfcru//EcRM2PajRgx5P3xUMGLZ
	 ahrnaZD6Cx4CTw0IOjxGXTYb40rnVYEB+HYpX830e2oZxIVePg1YDrpMlDTYN6ojlxNvu
	 LPit7vFcA/fxJx9b7UM3H0wwoHUvwZefa/PMbTkJYxoQr/cTRB27x6rPtfM5+og+hA22D
	 vdG/pIQSUaaACPtGAg7ipIM/E+jbwrME2WOWYEKHbLltDH1KJjFRNyGnweDtq2f2P35O8
	 Hd6MuXDj3xtGI9eTOCRZtq9f7LIW0oLtUtLu5BUDNp1TuICJPMgLH1Ey4mPeNoCYZ8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=BdNFe7I+aOZIYc5jfAvJU39qKEvdsp2/ywq7TpQP4oM=;
	b=IvngWsxv/RZ0wC8GudDZX7BprO+CyzXE8xAwDH87bJPZ0ktRsMwXteMzs/0IPmExMrio
	 jojuWwb/cd0wx07IxKrqlyjKc3PyQtaIw0DSJMmSHKKumHrPTtWWvHVa0XA3kTjqWXeEL
	 dql3kwnk35LETkbRhB5OByDgootPzdu8qhrqg62lWFvizhiZrka5ViPziSRp48w7H2V2/
	 1bj+f8HUvA5mLjvfx5AaxW1E94aY7PIzK4PttTG/OrFIUhFyta3W0/3CYb4qh3pg5XL7f
	 Q3LDKN1N41wQe9ooyz9xuhdYSQODIN8n/F7T9JuyTII1tnIM0mZlRr8R0APNL4tRorQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OcOP6SPw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11134606A32A
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 04:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11134606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OcOP6SPw
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53669f7b518so8978831cf.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 20:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794543672; cv=none;
        d=google.com; s=arc-20260327;
        b=D5suOQoGfx/M81JxK3i6r1j5nB2yuYXNXflkW70BtrcNJDM0DNC+oSEn1Yi3Ac/MxM
         5tMF78L0DZBZNHT5Zl12itzkCoxCjHnYepn2b0DX86mBo5CuUFiVbiOr5npxG4RxqmNL
         vgaO6jMSwJaGokhwKe3f6Ou3Nk32NTJd6tHDKWL/e76oWhYZLgfQK0IDGXy84Fe+Xm98
         HVWX+iQNf8QpqWOP7NZ2JzMNLmLWJjWhLzclekT1iV8dtJr5wsLwxJtxBNdIQpwIMyc+
         JmIqAdJfdCdQrzyODxOIhVhzT8+kw2aWnnT4xtC84WFSQrJa8RyI9khPvjXLmCiUhllx
         5ySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=BdNFe7I+aOZIYc5jfAvJU39qKEvdsp2/ywq7TpQP4oM=;
        fh=20iamfr+CJqOVtwquDzdOUBf52nGXLlCaWKQRl9w0hI=;
        b=N1mmFzehgvtjVsyrrpE+wJRIQKJTI1PMPwPYt1yAKi7HbQyEQ3TuPfkbFU7ziykidf
         HzlkRbrYZBlCAiYx4vGoONIHOWIEqZLMce/QtTd91qfnC62qaSpzKWMQe+M1nh5d6tvi
         cyl0WgFNoh//t3nAGLX7G43kWccoWiXd7Sq84By7Zrsu/PmXsucUimskpfntXaPtWX1R
         KVjkxu1Z3G62W8g9khV2Zj81MZJptsNeQapXRDu5AGDjT2G7SMBKSWXjgtvA7gB58l+l
         9Ct8tGzSZa2exgtNxQIV89ucbNxbagYImCNgL1gRc2Y/2nw0xCovCCq2kB2OvT6kfkQo
         R64g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794543672; x=1795148472; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdNFe7I+aOZIYc5jfAvJU39qKEvdsp2/ywq7TpQP4oM=;
        b=OcOP6SPwfGVjfk2vk7Kf3JWIasna8TKF5+LlJEBONoNmpJXqQrJvILfKRrsFawcrdm
         IvE9pAsj3dXuzzQ8AE5TbZS/R9QMlZRAPMD1CtMapbUPY0IftEKFV1+Y28xZFSgLaRWX
         DoLvd+aqdCs/sNUNZcbl1Nvy1ciTiuidyK41HlSjCLeAwMlnRbmXNNKXaTF4yq3v+TeN
         X2V+M+PTuv5Jw6FN99QfkFGxCM+o4A4fTueWz1k4063wiX0wlMi1KxJmbJBBpt4Juumt
         3bfKWTDBuCLriIUR3uG0JBbQ/rvmRNAp7QeFQKNKf2huongfnqyhbgrNA5gmr8rnLxfS
         65dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794543672; x=1795148472;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdNFe7I+aOZIYc5jfAvJU39qKEvdsp2/ywq7TpQP4oM=;
        b=HWElF/W2ZAYglfPuUa6ETGjUfqEEB5IazqPWvLnuHPQ58+XktfmL+uQlEmX+fo1TB6
         G0Jwp7+K8PWLIkA9z9U8T7R+YjnDvL4hyAknqwRJY34lY6s/dCquO0mbLLZ2QQanl2Lx
         +XQKjLJMCQhATbGvNXdvcHTitbfVedRkZcF7d+mnlVaLDhbNuwyuLKA2ibkiDaLoQvbN
         Vvw7ocDP4dEiZXwJV5z1CynLd9VsLGpGh4wY6R41myJ96FEamZ3HQTybIFthN4R0+I/Y
         IXvXXs9FAp+K5Nibh1PCup/Vjq0myyovTeh8EbmsOAaOcgoFf779NfMMYTd7QPe/Mt82
         G3oA==
X-Gm-Message-State: APuU4Z8arL+2DZp6uD4AFVTP6bId71E280q1kFl6V8H8JAt0FekTXE5e
	yTVDiUTRP21X3C6UBtCFca7mBQ5nMfAQKM0zpt4X23J4BazuPy/BJmke6HkieUWglbEzSAko/XH
	eT64dNrKm0ltsinB+bHzOup3GvRXAQLY=
X-Gm-Gg: AYBFou3srfCH+BAfL73q9LS4faDmRaHV+yIi7N5AVbuk0oNDqlkVnSa978zZj9licQ7
	eM0lPgkF1444gn+l4XORZvB5bqMQ299EgITU2n26DZiSTbAuh4/seBX7JsLgOh1cor7iSAZcSLs
	wQYBC42gLGhGz+lZg36+VZR5lp0RuG6bxdbkD+IOQ2Qly1lnbY492cHG/Ng51m3ITQ0GUkSFHd9
	zMKZycRzWP95xPfSlsL4IYdq0WAxIBlnFw6PIgoNwqPlyS52cK+8PHB2nNmiKepO6ZJq2lQpIOa
	OrB4xBi5UwuFCmMAK4xQRgwd2/LXuK4RH3XyGMULNB/OJUramrfjGsC3pe5zNhMPJrfgeQfNZ/r
	Dd+bhEH9ZFvuhS1gz/277QeWetB3sJFt/ZjHdChrJe1+rYuzQ5Ns49f6+hLFEXQboaK6tIrJyHM
	ZIiy7e7WnM2Mf+tGs1hH6/gF6bdiG8siUuMqWn
X-Received: by 2002:a05:622a:a58a:b0:536:35e1:b5 with SMTP id
 d75a77b69052e-55ac3363fccmr24163281cf.1.1794543671941; Thu, 12 Nov 2026
 20:21:11 -0800 (PST)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Nov 2026 23:21:10 -0500
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
In-Reply-To: 20261113011234.45270-1-diegomancera.dev@gmail.com
References: 20261113011234.45270-1-diegomancera.dev@gmail.com
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 23:21:10 -0500
X-Gm-Features: AclHuK8Vg0T6W_EJcB7LJOxNFCo5T5bVUA5gjr-c9q7orQ4IGb3OUxb4r-MnfVs
Message-ID: <CALruWrWRWRU84AkDocSnNMSRp+WQD5ic9G_3peE50BvQR5iGBg@mail.gmail.com>
Subject: [PATCH v2] media: em28xx: clear dev->v4l2 when v4l2 init fails
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com, 
	diegomancera.dev@gmail.com
Content-Type: text/plain; charset="UTF-8"

In em28xx_v4l2_init(), if an error occurs after video_register_device()
succeeds, the unregister_dev error path unregisters the video devices and
drops the initial v4l2_dev reference, but leaves dev->v4l2 set.

An em28xx_v4l2_open() call already in progress (such as from v4l_id)
that blocked on dev->lock while em28xx_v4l2_init() held it will then
find dev->v4l2 still non-NULL and succeed on an unregistered node
instead of returning -ENODEV. When the device is later disconnected,
em28xx_v4l2_fini() also sees dev->v4l2 is still set and calls
v4l2_device_put() a second time, dropping the refcount to zero and
freeing v4l2 while v4l_id still holds it, causing a slab-use-after-free
in v4l2_open().

Fix this by clearing dev->v4l2 under dev->lock in the unregister_dev
error path of em28xx_v4l2_init().

Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Cc: stable@vger.kernel.org
Reported-by: syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
Changes in v2:
- Drop the non-standard 'Assisted-by: Gemini' trailer that failed checkpatch.

Note: compile-tested drivers/media/usb/em28xx/em28xx_video.o with
allmodconfig (no warnings); not runtime-tested locally against the
syzbot reproducer.

 drivers/media/usb/em28xx/em28xx-video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c
b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d486..f78325a41124 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -3129,6 +3129,12 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}

+	/*
+	 * Clear dev->v4l2 to prevent an in-progress em28xx_v4l2_open() from
+	 * succeeding on an unregistered node (returning -ENODEV instead) and
+	 * to prevent em28xx_v4l2_fini() from tearing down the instance again.
+	 */
+	dev->v4l2 = NULL;
 	mutex_unlock(&dev->lock);

 	/*
-- 
2.56.1
