Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794536368;
	b=L0+LikDNI7mqXjbCvw5W5yn+3Q0Wv2T17bCnkiKkQqGTRG03pYpl4qIx44IhmBvO+Xs/
	 p19FbYR4mZ9PGQ+IFrenlryEpqLBMVzHql4jJ9hUIhiqOb/aycPm1/WoXo4IRvcFll7F3
	 nEsuE3Jx4WcmvB3dim6Ks66MzN+7jjORtB9vrZfQ/TMiYb4M1QhtPqALOFVAr2fubuQ+D
	 v/ItXzrtw57fIl36OHB3cqUhV2VIYA79cfTJgFfdvJuqYj3ic3iO/y+i+5RkSqDoIYFjx
	 C6ctjOL+T9wxJ7jjYmz13I5bX1Kun21EFdUEJpCPsWx5Bk/ggpnnCpe4hjw0NBSSabw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794536368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5JVpliFF/zW0d5ciE3yPTBWFRjXmBG6cV2z1o1LVjBc=;
	b=nrFVXdkVqCStneo1CcOQI+ct7cCaBHf8Zx53lgVvyBNvkLBcuWvkVqT5qZDhNji0meYy
	 QFeCX3OBwcNksDJqAwqTxS913y+Joc36WfnPzoT4CUqJ7L5TlgMooqScn+Aa7nNU5+b/t
	 xJ/Xdq5GIH8cg3p72Ui8f7yLeUdASBK9FwGsKyfCu5cXgOTsAfsBVhvdAnPjaWN3/5m7D
	 VhMqHk1Cwx98eXEokQ65MOI2lxTs8VNXspnuQ5RHCbgCX6hw/+FkPd3d2eIEmM4+35DFA
	 v90GElSmGBZUp736OhtPEu5wA86vYjUn9m/SMFOp2jQ5xAoaxrZMO7TkX0U+ExLgO1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pmxg1TNT;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC779606A321
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 02:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC779606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pmxg1TNT
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e96be2196bso1842445ad.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 18:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794536367; x=1795141167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5JVpliFF/zW0d5ciE3yPTBWFRjXmBG6cV2z1o1LVjBc=;
        b=pmxg1TNTKgX1wUemc9tbaD27EonEgHNpKfEsDQ5SaB41fOZywvGTQtP74jfqCviQfr
         Mvv0XuNXAGBjTwTliCmhiNunqtPG5mH00rafcGKX6Erb6676bic3G6K8pc9CqwK897+X
         96UAIKY/qdBdU71mTacTx39q0lEaQpgRAOHVylk5CglQ5rqF1j6xT8zl59XPIF6aFmKr
         q/Tq3B0O1dpvSI9d6C+mCoHQPpSNDI/0Z6HV/zsZ4z10GATb+6eIKpx+0fkKpzUxpXN+
         M3aQPsxbUiVqxxQao4KS0gzjmijot2xvp9vry198v+BnZ4ag4taHG9YWgD/55Knp8l7e
         cCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794536367; x=1795141167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JVpliFF/zW0d5ciE3yPTBWFRjXmBG6cV2z1o1LVjBc=;
        b=mhPJ6gNpO/QKWy6DcISB7B2R6gsSc05+HxeOcS8uYQtmLDJMU5sEIDcMsrvW8gHcve
         Si7KWEMrVBfY+MFiWcN8ZRjd+79VzdFHPJJxXkfNKfi6zxWycml/R27Jp2lgVb9fcDyY
         qV5iQuUscV+xilM0aTvJ8g605J/KI+48tg1txn1JNcpT1vNlVMHUs94k10MUWFhKquMX
         ttLMMKGHoEM+VQnkLmdmdN0o6ALQMDsGWuzw7SC6Odn+6QUSp9K83z1m046zK+iPDpKZ
         lGUIQr8MS4WLmv6NSEMjPNx2o/pnifvtLYQ3brB4CGjUn0QXnMoz9+koXdHl87IzNMzM
         wzhA==
X-Forwarded-Encrypted: i=1; AL+hErFxX+8iFJu5EtVX9Pp2C+tTirDWEEZz9IDqDDdqI4Iv+b3ngQmSOZDtfw7ZGpUhJKr2k2DnthB3SXlWfw==@vger.kernel.org
X-Gm-Message-State: APuU4Z83h8QynBZdKzXgryFcnLKJJyup4TaX10XHdlYDw/ixhxkzM/bb
	hn5Ify7y/I4Baq9VNPbawf9jGNiZ0rAMaU+LzOonUjahwTFmonCN4ik8
X-Gm-Gg: AYBFou3upZeKU1EeJuJyODXOAPkLAjaGYPvSpKUxsJLG3APEmkw5hzAiifZ0fKuy1ro
	PUUoC5LL1PVPSEM8VGXXYvLuOjbQ1tKVo8bFfSBOGh3JlzVFJ0qbMYYUzW5EA1ZNa3yKTCNeE1G
	zUN3zV3ItAruYtPKCjPEsTSwr628Myd/wEqywMy+Thl/m2ze7XKd4vkcNnLMqnYeuRlMlRfIKS3
	bVw0BEi/Gtz4igCRae8o5nvD26fOpUqMfZeCmAg/oMG+iE8tuZ3bH8jBC6NVbU+Y4Re1ibZC6th
	KqJ8EeEKfFeV6DWqsz6+yj/0PBGzAfMNVU/Lxq5kdaXveh9k1thre9PetGu+EonylxgBT0g6RkM
	FJuEFLxM9kHZv8fECGHkbYLuwY1wMK0WPDy/DH1fRKBKKPE3T74EZviE29hk3cfeZQk7/99a6MJ
	1ufJKhyS04Q9C1AQQbVv3xcPhzGgMH++ndk53Iw2Wt3QraX95PW/WRMqEpbU5Syi+DwdlMy7wgH
	ydFNVUtL9W7UNoT/EIwKlL7Li1dmZIpZeJyA4YMCHwT32nslZYgHEW0xk8je4ue8G8NjyG+0ZKy
	g/hPQQIPgocRO5theyi7rbe8fg==
X-Received: by 2002:a17:902:f70b:b0:2ed:537d:f00 with SMTP id d9443c01a7336-2ee0dc95988mr9962055ad.56.1794536366822;
        Thu, 12 Nov 2026 18:19:26 -0800 (PST)
Received: from world ([2409:8a28:ae4:7f20:114b:916a:a0f2:66e5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f9f0408sm2895255ad.65.2026.11.12.18.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:19:25 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH v2] media: media-entity: make media_entity_cleanup() a no-op macro without MC
Date: Fri, 13 Nov 2026 10:18:45 +0800
Message-ID: <20261113021845.1697485-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Without CONFIG_MEDIA_CONTROLLER, struct v4l2_subdev has no entity member.
Calls such as media_entity_cleanup(&sd->entity) therefore fail to
compile even though the function does nothing:

  drivers/media/i2c/cx25840/cx25840-core.c:3964:41: error:
  'struct v4l2_subdev' has no member named 'entity'

Turn media_entity_cleanup() into a macro that discards its argument when
CONFIG_MEDIA_CONTROLLER is disabled.  This fixes the cx25840 build and
any other caller passing a member that only exists with the media
controller API enabled.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Fixes: 634be628b5cc ("media: i2c: cx25840-core: Add missing media_entity_cleanup()")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=222245
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---

Notes:
    Hi Sakari, thanks for the review and the suggestion.
    
    v2:
    - Make media_entity_cleanup() a no-op macro without
      CONFIG_MEDIA_CONTROLLER instead of guarding each caller (suggested by
      Sakari).
    
    AI assistance: the change and this changelog were drafted with the Qoder
    coding assistant; the sender reviewed it and ran the builds with
    CONFIG_MEDIA_CONTROLLER=n and =y.

 include/media/media-entity.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index fa393e840669..400e08598dd6 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -729,9 +729,13 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
  * zeroed but that has not been initialized with media_entity_pads_init() is
  * valid and is a no-op.
  */
+#ifdef CONFIG_MEDIA_CONTROLLER
 static inline void media_entity_cleanup(struct media_entity *entity)
 {
 }
+#else
+#define media_entity_cleanup(...)	do { } while (0)
+#endif
 
 /**
  * media_get_pad_index() - retrieves a pad index from an entity
-- 
2.56.1

