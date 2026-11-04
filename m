Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823823;
	b=kpoHrkQxAnijimRTFegPzffPbZgEhg6/B9c6Y1NALjnR0iXu1zoVX5/GpL1etle6sHop
	 vxt4VZKmj1SMO59amppSYPAnE2lxe2fDcSn3ruqWh60frvt33QW9DW15LX1StKfMqNKJk
	 iwEpr+J/GsyPBnlFaEb40brxTn6SGp++z+FcIbdWSL1S4FRhFv+hUQ4+G9pKVMG1y0Vej
	 ez2FWZMaG8iLrQdkBJHqDcqSzHZI34Y2PKt+t8yA5gVOtwFCXf74mH2KZ02UdNkQ2B4Pf
	 Mx6UhLuUskPU1r770Vdf3pIklN7akiqsEqPY0DlrKrj6RFS/Ye+0D63gCLsmu0LBuKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
	b=LuXYIgjEjtgX+glStglPfFh7158R4ayiaeJ9HyZNN3E2KcSC9itWHyMtYJSuAK0/kdb0
	 /c4DK5o7RTwjvsELE4YQ12aRMO0A2AYTSoRP4eAJDROSN/7IE2yiUEqWiYKI5mf7LwG7M
	 XdTTPulJ0lRWa+C9QI0sCYEZY+uc7AGdPc8YT+IjxP9yJ06BFblAZzGOya+fhCzuB9DXu
	 mCm2JBbnJPTSP5w4XXuuGQdMIgU/bQRLysAbyB3QkYu+/uEQZUU0aIKscTzolmxlgrCjm
	 uEEb0m/okZWRdMYIR7OXDVRSujnhXjcR7gcjXy7W29mFgd/SiFLOIZKXNNyC7q9rREw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Z8uwGtcb;
	arc=none smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F18607031A
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 20:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F18607031A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Z8uwGtcb
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-679334baa1fso1834236d50.2
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 12:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1793823822; x=1794428622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=Z8uwGtcbyWBahZ3GFcKDtGsJVAc0jTZIvWB0OzZuKK+IXcoOG/x+ITp4FAXNEWVB+Z
         sTa4axeNILHYeEOzLSB4JyfaTPjCy+spkLktbA8RAy4nRaP66cZBamPbROd/a971Rk1D
         t2x5vXUU3/rRPT5RRUvvqlmrHql9DZ4TZtn4U36QNSS9WR0gxzUF7f+DfDyHGQGKqgPj
         tUEFF/wBJ4n5YKV3tgGjalViIQoxsli11dZ8dY8LvindVcGwG5lfkFXVEl44o+GCs1Dd
         AYgtxS5BbaD7Y0Vc0sAHALfahvkXryM//K77guO/qfC5halpZ2icbEgLfh7vfU2xunQi
         SIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823822; x=1794428622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SxUNGC6LHFE1YR9ZyIoWZKeW0R1pf1aABtzjxttvXsY=;
        b=qNIny+kTQM4xcys3Rb/aTzem8UjrZjT3HAz7JDbU82hNMi8dUqcVpdZnQu8Qxp2KTT
         jpztASZ92mbxsXzVYuFq6c+eQ3h4sobyTWUwQF+40mzQe2jPFOGcmAEb4Aq31ZQ6ITTH
         EjkBlk848lkgp1f6bx76REWTF1wI+0AxCBhPo/6xEwb52zRzcUTUORHbyndOBPfVEKDH
         +gMMK83G8V/UJbjZ6eLUF4J2AiKfETwtsx5rkjtmu6EfiLQuZgDu79MlRsIkwT6DKIGN
         0AzP896vlhIqKis58jZtnI/+UQPVNjrntk5aF3OnOELob937/JaPoxYgskrvt1yQW7K6
         VTng==
X-Forwarded-Encrypted: i=1; AKwUvBxNSSPu7wZ8YVf84k0JlGR/yF2dKUQK7bYyPd0h325msvyNZQTLTEF/n4meIqzTlQUdzVfahp4GEjCo4Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+9lTIVN6QT4TLP0crukJT5kYgi8OGwsmzKyJ6nkPYzemZJlC7Y
	vSv00wH3JDckrfVhzGUgqdWOn8bsk/lIMeD95URfc8699IdP6yh5ViRKVq/uDlQiMJ8=
X-Gm-Gg: AYBFou30403s9AkhPfShuM2V+cvyPkvQYtDT+vo7D838soV8zxsNhs3dKwpYj/K207c
	DF1srIbx5revVYHJFT1eWlo4pWJVd+qsrdTOTaDLbDg0a/dIiT3r4PtinrYorq3jx1flCuqFBR7
	0IsIaC4IXu6YW1iP96ucj8bX+1COf+LDrRArcCpqou2CM99DNeFB0mAhz4pQQXvAT5FC4vgHUqj
	dH8XU/AeBJBAdgBtCP1XaaSiziQsK0qk4Aw9T5wB/ISxNKHyxwft+xToCrklASJOwlZTJJfU7fp
	zAkRpxSphZGLPnGXL52jg3zhFSno4XTjKG3hPdpZjyfmgLF4toxFEfU+SvcCUGWg8BWIwjo8C1n
	/7BYzAsF4uhN2FT3pO905DyNrmk6J1qxQvngQ0krxp0/IivWK+g48k4yE6gnNPRD8znGGxsxJsV
	kcp1ruffxA5zRiaU0Nxq8NYxl4JhLgwePPqXJTI6lijmEddwCLdEAOcpjQMrImwvqt0rIRPepZI
	gyKlWqBD4mgk0ANvn7AKMvnpbcw2eLBK3XhywMr1QwFTEirzVCuKw0rFQpbeGhP9gnyUHr/5M6t
	tUAMf5NHO0u5wnHOwUKzalOQRSq+uF8eGRdAC6sgEAAvMoKZ4Tu5ZWX87LeQkgiHtLAQpNeZMpJ
	yDCk3tdu4uAPCFkqfjvr9Fy5W
X-Received: by 2002:a05:690e:12cb:b0:67b:bf6b:d9e3 with SMTP id 956f58d0204a3-67bbf6bdd12mr6448256d50.48.1793823811217;
        Wed, 04 Nov 2026 12:23:31 -0800 (PST)
Received: from localhost.localdomain ([104.28.244.23])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bf91b6e7dsm1298292d50.13.2026.11.04.12.23.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 12:23:30 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] media: qcom: camss: do not fail CSID power up without a matching VFE
Date: Wed,  4 Nov 2026 17:23:13 -0300
Message-Id: <20261104202313.72494-5-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
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

csid_set_power() powers up the VFE with the same index as the CSID
before the CSID itself, through parent_dev_ops->get(). The VFE
implementation, vfe_parent_dev_ops_get(), returns -EINVAL when there is
no VFE with that index.

On the ISPIF based SoCs there are more CSIDs than VFEs: MSM8916 (and
MSM8226) have two CSIDs and a single VFE, and the ISPIF routes either
CSID to it. Streaming from CSID1 then fails right away with

  qcom-camss ...: Failed to power up pipeline: -22

although the pipeline CSID1 -> ISPIF -> VFE0 is valid.

Return 0 when there is no VFE of the same index: there is nothing to
power up for that CSID, the VFE in the pipeline is powered by its own
subdev. vfe_parent_dev_ops_put() already ignores such indexes.

Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93..532f6d36d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4631,15 +4631,16 @@ static int camss_read_version(struct camss *camss)
 
 static int vfe_parent_dev_ops_get(struct camss *camss, int id)
 {
-	int ret = -EINVAL;
-
-	if (id < camss->res->vfe_num) {
-		struct vfe_device *vfe = &camss->vfe[id];
-
-		ret = vfe_get(vfe);
-	}
+	/*
+	 * On the ISPIF based SoCs any CSID can feed any VFE, and there may be
+	 * more CSIDs than VFEs (MSM8916: two CSIDs, one VFE). A CSID without a
+	 * VFE of the same index has no parent to power up: the VFE that ends
+	 * up in the pipeline is powered by its own subdev.
+	 */
+	if (id >= camss->res->vfe_num)
+		return 0;
 
-	return ret;
+	return vfe_get(&camss->vfe[id]);
 }
 
 static int vfe_parent_dev_ops_put(struct camss *camss, int id)
-- 
2.43.0

