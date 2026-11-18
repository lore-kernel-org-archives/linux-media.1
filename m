Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962311;
	b=wdGbFVasehmuppXsR2O9m+dwtdG+9Xc7PkwSdeNz+ebvizYL8DNBXElonFgDANdJVpko
	 Vs+CI+IrrCC02h/vjaUA/MLFpKpnNuTwm6akvtiRJx+8B7T2VMAn7l9xSs+jvbt/FZjtZ
	 H0lbn6Ff/i+jcl+ToTAfTIQhiVVlK7lfdf2468UGSKTy5OIGouULQ8oRWHZnc153p1DQ2
	 FvFVf+T2JoG9vAkjukZHNHjOF2myLLosTxVvNC9qH0PU0xncQ3xUQlN9Qg1keQDDJ9QNT
	 zLZHYCHOEWkvGPFCrqWPYKFP6EvV5/dOBPu9OBdUgULvQHObb0gxJh8teXZ5sRNJqYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
	b=SR0bH+Toq+YBWKrsyggRhG+7cdD59fKtRIIwEK2OpHS/G+XhMS2dX1GI36Nfx0LF+2Sd
	 GiIiSav3sNYJQqICjnL4ZDb3XnXYVHOEvvVhjK5xSoTOwkAyZHWW5WPlf7L7ygPQSfIoV
	 tDY4ZYjX/Sl58Rzyo5zmm1namuwUqEUtoJl8zRhXO9I7JV+Aj1kyuXW32Q07aFxNGjfwd
	 WCNY3t76BUYUIVkvsTSLro8z/K0UrlmvIpQNApjUrBIuJg/gU05KVS0bZogZ89J/bvT6C
	 biEmdzPiFepZttIfIkX8wZKLXAM+tSaym7VbIn0k4KWB8i1R3nquAdhAVkoZdDzRsjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3O2G2t7;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7934606A33A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 00:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7934606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j3O2G2t7
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-382c3c9671fso223062eec.0
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 16:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962308; x=1795567108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=j3O2G2t7EleXwjDSIAXaqkz83fmJajqHRFZEKncFhXPzTewJP43CrYnwjn/nS6ICvu
         JiUf9vSIqK/o3Ps1+23SbUg8UJwXFTWSfZYptuVEOlCUI851mjLbKEGjJ4DbmrN4IXj4
         AT3ClrCSKvM+DL6z7k8MFJzs65x7VUkXkTJZUNm8dBbo8s73K2zY7cCZaVH3K5tPA3K6
         q2AePKO+oIU67bI6wd8jOnUFfPugWm6jTtc7oBZXdNWhB5AGfdxAVh0orWOBDiLKcTOI
         Ua3kmlgGLa6NkPqhQh8ew4KonWIIzhdfh+Bbv2vj+MRtQYuggZu436UmGgQ26MmfER/V
         oSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962308; x=1795567108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jigjp+fj5LXEgFrf+eIYUR/gBYQiXZlMSZoHeYqq3yY=;
        b=Chg7KGdzAGNI/Z7FIj2IbgckWCS/NE3NWe0CJ9b0bxSnemkm2dS+84XfI0MzLwMelq
         WxS5WPlVnBxhSHFQuVNbZhc21VgkGx8elkNKzTQqRJKPNMUVjdptHKwJ7RpWaDKg6A0O
         aCyTUpaak8ekc852KvcekKfw6r3IblsCXECM/2okzVfeuGNKDQdizUP/6g7h23cF8Pxu
         BZ9C5bVzx9YpE4hIPvat/6qqlKCfELSaWz64KqE31erNwDtT5ABNdoDx7ssGqy2Ql6nd
         oiPoHDFAQXQDppj2IWIl0MVPMbjdt+2cHv1gg39FPo0Logg4snexUUaerTFeQ76C+b/t
         JHvg==
X-Forwarded-Encrypted: i=1; AL+hErEJ5juI+GcqBFNck9aUXqhaf4EVjc5Hk1di9bgPMCVhXuHHXdt2D5MCGrlZB4zBDqtF84w9MspjprJLjA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/U8SAWr8Ar9dHrCTjrH9l9laMpYJA397WIDdlLTfsSReBuJoyq
	2NaLbaRC+tBD89xEJzWQPbyLsPqyafbtTlH5Ud0QysTjG5KHtpCqpBXX
X-Gm-Gg: AZFdTZeGns+F/cZTZL16yko8wBGmySnVpP39Wkw1dgAH74egdMRiiXHRtnSOkWT+f1N
	H7tixbqDv3JDEP83nye6DuPv+6fm91nGrmURab8Mo/kfp9tA0QP3g39IXYQcxD70/5ePqPrGJNe
	VDEiIXoRFnbH7kSaogEbS91B8Wmn/ZXFJHabcjjNWpvU9DfnqVLNH6ql07TX7dsq+bKN81fDIft
	r+hoYvsZ4QRj41qOAEq9fjTL3VaNL+veXT/b7SmcO7u6GvaUbluPFZNepkjAK7qzqRyvS1zWmEr
	WJQDVHRvZHOirVub0Ns/EngzUh2dWRFtXwc9kxju6aXKPw6kNVW2bvqeVuqcsIJvFAmQsdUccCD
	A3HZ2jfewrprydS+2wf25vkS3chrw2eDzALoczwI2CUqplM8yaFG1xitW5fzcCnFgI5DUS8aFj6
	K/JeKQA/cDR7yusTbS3ZmgXIiYerUxIPrnYUQQ7edtHL3PsJMpzjnt7hO6hDca5Gu+t7W9rEy/Z
	6pu/QZv+tsNKBR1w435vBodsCEWIxkbiapb6AO06u7dTXcikI37HvaV3zI+GL2q/HvV+ncfuzGs
	qy9JUtfpniw+8GrzJM/n8DgHNIGVMFeSdTfeYzhMSAsnc/zBgusN6MI/Fgc=
X-Received: by 2002:a05:7300:d18c:b0:36e:53bc:467d with SMTP id 5a478bee46e88-3827abdf096mr807203eec.0.1794962307806;
        Tue, 17 Nov 2026 16:38:27 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm1523892eec.21.2026.11.17.16.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:38:27 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: paulo.ravazzano@gmail.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: saa7115: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 21:37:42 -0300
Message-ID: <20261118003742.363133-2-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
References: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
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

The entity member of struct v4l2_subdev is only defined when
CONFIG_MEDIA_CONTROLLER is enabled, so the unconditional
media_entity_cleanup(&sd->entity) calls added by commit 6787d5189e32
break the build when CONFIG_MEDIA_CONTROLLER is disabled.

Guard both calls with #if defined(CONFIG_MEDIA_CONTROLLER).

An AI agent was used to find the bug. The correction was done manually.

Fixes: 6787d5189e32 ("media: i2c: saa7115: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/saa7115.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index f4015f113..32c526df1 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -1868,7 +1868,9 @@ static int saa711x_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 	v4l2_ctrl_auto_cluster(2, &state->agc, 0, true);
@@ -1927,7 +1929,9 @@ static void saa711x_remove(struct i2c_client *client)
 
 	v4l2_device_unregister_subdev(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&sd->entity);
+#endif
 }
 
 static const struct i2c_device_id saa711x_id[] = {
-- 
2.56.1

