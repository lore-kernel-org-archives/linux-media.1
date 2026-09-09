Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D70499F04
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 08:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940977; cv=none; b=to11JPXTg6FkKnYMH4q5xNdTjt/bJwHTDPquTKNAJ3/oLBPg+492RkZwmzNx9Y+hwJn7UbH9nF36N/dcCuEm1c/TEIt2s2yT9u0sYTFPdwUh4bqT+jy46TOoCCEqPGg55K4OZIHN+UQ1WSnLPRkoldY8/QWL/Qz1UeGParorv1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940977; c=relaxed/simple;
	bh=/m0RpJ0u8S5AhBcgXm1RmBFb5U3snGeLm8WGcbiID5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gg9z3pXvqFpMFkboe00ULh97x8lEhmcXQQXr4MJPz4cfoQCecGqFh3PNuAhN+5/nfb9e9UWql1MM/5wQOssDbgAKbbHH1Pd54hByABZaKHpPxApqprnxYC81s9Ipdocm4YmrT38vYO77S541/8OARdyOQCCSF3k7NfV9oXYFI1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1GlQuqd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1GlQuqd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so65389785e9.1
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 01:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940974; x=1789545774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVDpspAXsp3IRqO0vAB8A/WjYsXTyisUBY8DG2eZLy8=;
        b=A1GlQuqdfGVUGWy8D+0ghB1MHVrUG8KPVFumA5pVVLslWymUDszMXEJYDEKNdzSYO5
         +LVUIOjoRjwlb3Fib2F0f61oJpYWJgVbmzlBlIbBOXvoFWs1llrFpPrZOHNfppHH3X+a
         mRaR45Tu8oq5AKYn3VjKjESQuGwXlDDH5S7q3Ka5ZUBqQuMRj2p4YR1+i8hnLP8kXhXI
         RNT2zothJms6GhYcMHbJlvb4/2Rlh+2WeFwV1vrkA1RJbh3pW1Ndfy5KONxiY3WeWeuB
         o7QmrqKZ2XtCBL+IZss0sPB7braGfJaSi8Vu64j4R1NW4WbMKyFw37L6tzR2oN+2fNYZ
         7IWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940974; x=1789545774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVDpspAXsp3IRqO0vAB8A/WjYsXTyisUBY8DG2eZLy8=;
        b=iFlmSFuRBw4TLPmL+Ms46Xm7QeiR3vzKQZ1MhiSopf/MXvA7di73oiwQaEQCie1TtN
         yeBNogmsyY8oIXtqqjWt/qWk8JIWLzvAkesVDKhMmtTSY43iHxKUINF4+SLPQ+tjxM9x
         ES/eSAM/AJP4faoY+Glcfb8FhWWKiOs2fYl8brcWZwmSfloW80+jPAtYu90bTjb1Eg7V
         SLqDMnjx4GAV95e4lwhNS7pjWie2MsmGdSHi5KEWgXw5jdVniMMt4TxnlGyXywiDlL8U
         tJSKddVT1+jfKZJAs3WW4/mxlZSgftFMwVBl7Men2FiO+2Ik7+JU1LU0vj+9aNCg8F5v
         jtYg==
X-Gm-Message-State: AFuF++kQnvsVWmwhiJhMNDIhHe3eUCzfHHYKlgbhBkaxct3pcPNjCo5j
	4DWEYQfchpLerJObb3rd+ThiI8eUVe9oZKY0BYpBoZ2iRRvgbIALBHsK
X-Gm-Gg: AYBFou2cVMD41oka4P7I7s2gtC7+lFUsTzvL6ocWIfamYaVr65OfzceKDpaf0H3w4jA
	xKjougrJK6/YEEgGPxBwqpb8et/I0ff0CvjZGiHU+oHBJ6Vn/X2Ok0ihCzaMq/If4tD8SRpZZzM
	TzXljCxpJo85q/neSKrC5t865D3E7Ttl9Y7sZehZ+vwjnQlEm/UckqROmPA8Ucl6xQ8dMdOWuV1
	dgKeVjqOw8nylAHjRkYjjDUrnIxbGFKLVjKpvyGQuWJc3HtJbTaAqBnkxOr3uPavQV19ta5TRrY
	St3RLGIo8KATjyIlUhu66hId2XUOp9woDS2LxWI0rkfIHeweM0MRNnsokMbxzR+032po8Z4y0KO
	7CW0UAYBEBXk6VkP2qHCpa2/1lP5HnZKbErB19Q9mKnq4ToPmRTDULjZoPNGb0gb9RBnTI/QcrH
	601CWZXeQvqbbtenpQUpuD8cdA2eufcAurVW9U/7R4SeAmg6ITv6xCLpP9Tucpe7T/EvM0Z//5K
	dtQAsqAKD22le4A3FeeVX5xDymQKGb+
X-Received: by 2002:a05:600c:3b9e:b0:49c:fc6c:be1a with SMTP id 5b1f17b1804b1-49cfc6cc121mr298320835e9.32.1788940974059;
        Wed, 09 Sep 2026 01:02:54 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.lan ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm412817125e9.3.2026.09.09.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:02:53 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	mani@kernel.org,
	michael.riesch@collabora.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 4/5] media: i2c: ov8858: Add missing v4l2_subdev_cleanup() call
Date: Wed,  9 Sep 2026 11:02:26 +0300
Message-ID: <388522f369605158e040af66390a2a518f3e38a2.1788940469.git.chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788940469.git.chubuchnyi@gmail.com>
References: <cover.1788940469.git.chubuchnyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The subdev active state allocated by v4l2_subdev_init_finalize() is leaked
on unbind. The driver has no common cleanup helper, so update both sites.

Fixes: e14d3ac81bd2 ("media: i2c: Add driver for OmniVision OV8858")
Cc: stable@vger.kernel.org
Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
---
 drivers/media/i2c/ov8858.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..2076620c7 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1953,6 +1953,7 @@ static int ov8858_probe(struct i2c_client *client)
 	pm_runtime_put_noidle(dev);
 	ov8858_power_off(ov8858);
 err_clean_entity:
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 err_free_handler:
 	v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
@@ -1966,6 +1967,7 @@ static void ov8858_remove(struct i2c_client *client)
 	struct ov8858 *ov8858 = sd_to_ov8858(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(&ov8858->ctrl_handler);
 
-- 
2.43.0

