Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1254A0159
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940981; cv=none; b=QaY734KLxwf3ztx2oZMdOEVd8fgarzacZ3Xmt2dxR8bVajn23+kS+BZCdpxRxEuRf6G2hNOpyNMmGcNd2cqJuY1+bOTpjbSBO4LLvGDi0yMIfncSfATQLXTsmevcWJI/BYkbULAYL3R6fJnfYV44ddcXN+3O6Yej5oa11qOjlmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940981; c=relaxed/simple;
	bh=kJZh6y94i6h+wIueUxNoBcL4CgBSHgSQrOmgm0f33jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y560EpSIEkKsMxqEBZKPKjnwRSMm0MvWTSnvQvn7UDXFRB/KfmDBQzDRehFJ9seHqNf8VNZatKalkGwW/AvnnNYDLp+6nMpo/uLuFLDhGXI6qwUuPYmY5nk02XwS3ZEfatVgiK4tlVDO2Fr6dPiAFVfE7NN3zDG9NPBJ2htern4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMsAcUIi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMsAcUIi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so44261925e9.3
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 01:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788940978; x=1789545778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0ImWj6rAclHhabuY+hCcTXmlRAswzPkBoaFWxuqP+A=;
        b=ZMsAcUIiUF6C3BHL1mLewfKZAyI0WyMqrU0VOXcxtvCPQSC6e2HxnaC7fv182denl0
         G9lzp8fA/qFbq6ODMUCulMDRXtTgvLdRnGvy9ojjw9XutRty9ICE8r3lt3Um28XyZbYt
         U5JLXAQyfooNdvGYI04ssVoY25M/M+Q1b4nUEFjRTA8v94JYKez90eXjSwuipGzZWwdJ
         KQ6XF4CCY3VCKdinF5aMeghd0fQQJxseUz2QXZJMJxlUdv98G6q/S01dwnqCb60FAFeG
         rE90MH094RudPzF9BizB6UY7VkjeVEw6cXN3XWBo1o7CR78DaLzqTLyPFVQS++cX6wru
         1tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940978; x=1789545778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E0ImWj6rAclHhabuY+hCcTXmlRAswzPkBoaFWxuqP+A=;
        b=ERZh5wQNAm8Occ6WgUeMVw2Ju7t9Z+ykjM2jWTTbCKeQ5GVjNolXLv+MP3Kc9sZ1Ge
         AdNgOllP/jc70UvQP7Zd4BdGE9TSlQrVd22hM1eUMsfCf9vEDpLUVQ+9ea2LF9KuB+pi
         L1kvLXJc3osoZZiv8oINCeUBFqAT/kpDFt4l26IEevoU+2dON45JMHK9HCQD8wtqlqEK
         wEB5L/O1vOPtX6uFyWWoJAvgSilF6gNWd0GIeLxfxrBSfJYgjB3nN+QCxIYOq24ut+7s
         Vrv1toG8iF3ARsg9XBNyclyqcD/vB42H0kk+a0OUc7xZf7x3BzUQkkk5mMx18ADAA9iw
         fZ9Q==
X-Gm-Message-State: AFuF++mcco134RaMp48ZMQnXIBoX7HSOCPUtW0cl2VQuZVfy/Sj39/bq
	aQAoM+znM6yXUyBoFykjFAHAOd7g9pM0MGAr79t2kB1wNfDkB3mNQV7x
X-Gm-Gg: AYBFou0bv1PRFot+qir3zOEiIthR/0lz2AAZO8PRcGKsmTtAK3ZEx9I+jVKsrNkekcB
	FDe28+2L0iXUpEE0uPDiupfNq/fXzIWr5H69O03mGbxA+6jOncyhaP1J/7pQ9rw3N2hKuavfrk+
	f9ROClMjfdQe+j8/tgjesst+Sn5cNZf5TITyyD1XtbSKAg1TMUJIXWO5oOyz+Wpy/hL5yZ5IA9j
	D5StG7k64c5nGREczQuYYcgbrFxQCFsMRVnybdUkJeZRS3Pzt5AQpB/qM9XUMOwr4Mpbwg2zl3I
	eA6kOPgNH2lv0vDgkvuGUlrV2fmOugwY7nNBoeXfVoUAjzGyQpEpjMXjOAY5QP3kaIKywsPX5Kd
	B6U1XA1Tk4WgMF3xPKTVkNAdoJl3I8gT0j2hJx7WFRPpCydX0Pp+HEo2EpdxheU3LcVu1baT/d+
	BlKAAyhf9AFYY8RgZPCTZrpCpsjbLDJxp75SoKKkBd1ui/x5xwyxWoFRnwQS0pabBAmMrV1fNwc
	EA21yHPmqnInIJFuLU7RZUZrdaonYoIcfJjsad4ow==
X-Received: by 2002:a05:600c:c3cc:10b0:49d:1d6a:4cfb with SMTP id 5b1f17b1804b1-49d1d6a4d7emr53938015e9.1.1788940977612;
        Wed, 09 Sep 2026 01:02:57 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.lan ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm412817125e9.3.2026.09.09.01.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:02:57 -0700 (PDT)
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
Subject: [PATCH 5/5] media: i2c: st-mipid02: Add missing v4l2_subdev_cleanup() call
Date: Wed,  9 Sep 2026 11:02:27 +0300
Message-ID: <12ac971583eaf4775a0242a58a6ed0a1fd08cdb3.1788940469.git.chubuchnyi@gmail.com>
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

Fixes: 04d170b288b3 ("media: i2c: st-mipid02: use active state to store pad formats")
Cc: stable@vger.kernel.org
Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
---
 drivers/media/i2c/st-mipid02.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 4675181af..b2f275129 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -919,6 +919,7 @@ static int mipid02_probe(struct i2c_client *client)
 power_off:
 	mipid02_set_power_off(&client->dev);
 entity_cleanup:
+	v4l2_subdev_cleanup(&bridge->sd);
 	media_entity_cleanup(&bridge->sd.entity);
 
 	return ret;
@@ -937,6 +938,7 @@ static void mipid02_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		mipid02_set_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	v4l2_subdev_cleanup(&bridge->sd);
 	media_entity_cleanup(&bridge->sd.entity);
 }
 
-- 
2.43.0

