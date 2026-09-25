Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E524D4D5993
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351936; cv=none; b=C5E7uTKG6JxMsZNuFZkrPm52gu91qcXf3uRVu3cS9EYnqz5ACbiwBwa/F5lkyclTuu3Gdm7farQMrNurhSllCXam9h2b/JpEQO3choXnlYo4NKZ+K8Th39Be8f85yXJY8+YsPUj/arULPKKJ/AF/YlR+DkW7ZiIXWVaz4brsMaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351936; c=relaxed/simple;
	bh=qesl20FztYwHUaqVY6JUi+5z94vsQZzkuaYhHZfbkm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpJahiEjFI6krw3wcTpM06GRISvszGTI0rPzP2FN2vrP5MtZ58mKYSd2xi9CwYIVphu9f+oUWyhkPjN7wHcqE7Mp0YpaqF6aWTcOXR5hshXaWQWoy8hR9m5SW5XaxBWAHpPLc/HupcA+O3scUJd6V4EzuOhIW0FHMge1y5/pYF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oC07C3/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TD0alMQj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oC07C3/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TD0alMQj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBLc8Y900186
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 15:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Re9X7fDOvky
	ZZ3WP/+UOZyExDqbDkyq0JV0CPbSwk4Q=; b=oC07C3/hiKVobgyyQIg7t959R6f
	YHcd6DGucgx6/9UpFntG6CVahsQTYbX9NStEygY0rqWNqzM9lktgwqw6h7BiZ5WQ
	4E23Qs7gfOsO/Blg36FLPBkfrqHgb0O7qKomekwLlF23B+f/HBi/lF4wBzIKRKd3
	zkRdSw+dIv0NIChmVGxtD8pShQR4kpxErNLGo/Yzu3JQjCIivC+kORcWIuUlKeZj
	Zg7jSRwWX79atchpE8gm896O7EmQMftWdmNGVG2xRGo7OQQ9rG7xY86AE0fO1oKW
	JaoK4iObBAaPykeRkFwndawxq6BxjfqRfn/ZQRDWFzAdwgyl4WhFm65/j1Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr100x8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 15:58:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-880fc944631so136485b3a.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351932; x=1790956732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Re9X7fDOvkyZZ3WP/+UOZyExDqbDkyq0JV0CPbSwk4Q=;
        b=TD0alMQjotioNfd6x+9NKd3f4EoCSa3scrLp4cEEPoXmqFr0pvSwlUvZOke9d1AKbV
         +1NNNCgH/bvv1Bu9mJX1DuatMR73VANfekW+N4xOO9KMJPPLGVYMM2UzVJ3gBW13u6DM
         0v5Q1Iyio8BRvY6bdNv4AVeaWILNta7O0jCx4ltYzgBmNLPtgAMVvAaV/p6XazTrjD3i
         nxp9TcbMJXOdUbf1AuqE3aU86EuLzg+VkpJe2WazO3XtkJqlKcxDOf2uhX+8/2jk1qQJ
         jqg8raL4cIs8hMsifn1crKfr53sRpg6iquhTA7QcJmXZa8/f4XxVrnKEFnYRPlU/eyl/
         z+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351932; x=1790956732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Re9X7fDOvkyZZ3WP/+UOZyExDqbDkyq0JV0CPbSwk4Q=;
        b=NfKkXk7BUYdzQvdW+/nUPYaTjYgCb8j77cseuo2w+4ayGgLWR83mN9I4tq5nKUGUE6
         WnuaSG6fKsQnviRkznm5D76rwTwyEf8VI4P3A1/5BHZHcxvCa6uXb3PzJF5RGaLY1Qfw
         Fyvnk+ub55jwMTtvy22BchtUVyRH7kbo0JPF/7K+dZkxQc094280uwIT/M+p94/oJVLS
         YOKnAwAsAJueDi6lrePPPZqpOoilfUnJSYges/Km0Kb1O1zJbYCxL6X38TVJF+KCiCh4
         WYM56totSSIp0fAFMpOsM0zKE4Y2XmWtQopCjXVmN7WN6zRc2SR2VX9U6oZhy3TDvmCd
         J7JA==
X-Forwarded-Encrypted: i=1; AKwUvBy5gdWr/Z0kldFp6jRedkr5PbTt/xJYET6jz3Os7WkNou16Dfr0bCqP22aaQiJxsmlmPsU2KtaJJuqhdg==@vger.kernel.org
X-Gm-Message-State: AFuF++muv2h34Qb2J9QHKnW9YE/krW7SX98EuXap+uNnIIRcZLjluXBu
	8KYQs+MyWCS1VA+6guOZLEoKlVqiDH5YuikV7AYDOq61Yb54vhiBasvkWYHBAOlUGcd6tiMCRMV
	m9ick+dAu2SjPKGKDR0K0MXztbyGdm/fZRyFjZRCNa159zomjwrkNET+CKVAwIKZ0LQ==
X-Gm-Gg: AYBFou1pMTQXeL/VB7LTzi5AWkO0qWMFNiqeoK1oVGtvVejAlQsIAB+z+oNuxaIrKrc
	dcIibrTK5MTfX2OX30k2O2qcDECHzhmb2Vl+qXrII5TmOsZFQUfxX1oYcC6VWnQKE4KNvA+IxIM
	UUHshGtiO3TcqkfswGvdZjE6im8ve1V6TAE9UUtKwGoxbq4MdQlsgOwIn+w9Ew6YkR6O0YULlc/
	/r3LsqDKxhN3Ld0I05sekGhfzJoH4JteZhVBRXIB/RfDNVc8bcjl/krXkgQt5EUyPtSmxEPvarV
	lxQAjhw+y/z+pZEnpfkJvbW/9UljhM+MAiXbK8zearPLLFkj24kdj3k6ufD5Q9xNxqG99U+VqmG
	Oonrx1MhHhJJAADqYsnbJ4m013/Q=
X-Received: by 2002:a05:6a00:ab86:b0:874:708d:b633 with SMTP id d2e1a72fcca58-87e9d8da7a5mr5033706b3a.31.1790351931522;
        Fri, 25 Sep 2026 08:58:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab86:b0:874:708d:b633 with SMTP id d2e1a72fcca58-87e9d8da7a5mr5033680b3a.31.1790351930939;
        Fri, 25 Sep 2026 08:58:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 5/8] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:34 +0530
Message-ID: <20260925155737.4161358-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX2kdTXMFwz7Yg
 8uh35JCdTbCXP+u9x4QJkJ0eW398zKpcQphOiDbMxkzvAq8eHDfdsOLG77gmBCeDzLttXLpq9y1
 Z/gdOpdSoKrr710+HaWdT3xnSvdtifiuohDwY/cgDHhUQ9vHjXw8+p8lr7j3BBPPg45HmkAs50h
 K0U8bJF6R7Y9ErJOOZwZtnenH7aKf9qY4Ey79bcBohMszU8PdArs8M5iCWniLICixkt8IzzwGFb
 w8GrumJp0lVjtF5e5zG2vkc++giAt5i50zEumvvXCfQ/BBlO1gvvrEFv0i0gY+oPvkdNFcHHqDg
 T3Nldh87w0k2KlgdqAohACTiwYtTAjEurLsWjSvvWSzeBtZ5/vuyxYw6qmRxrEI98jfC+04rNIt
 vpWADjnQLIV4SoHLpIcHKARODlAGmhWgIUHUWjTbF33WDNKN3/f01J9q7LTwcpNJGv5QTNQ132S
 VWAT5NptikR+8IojtQQ==
X-Authority-Analysis: v=2.4 cv=ZfKIpcVA c=1 sm=1 tr=0 ts=6ab69a3c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=P8P2WCEqvqb6tQ3B-mUA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: i2pYkJ3uxq20FrmWpvsTE_iBjhsw8PWS
X-Proofpoint-GUID: i2pYkJ3uxq20FrmWpvsTE_iBjhsw8PWS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX3lohuw6KRA23
 otE9Sah8hKAwqObwIiF/R+cWk6te2ZSWV5kdYQlteLA1hn7pFryhZN5J5BFSggpVcLVxXfvQXce
 xKljvJIDK0xx0qVm8+vmHF7ZaUOMehU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250063

ipa_firmware_load() calls qcom_mdt_load() which bundles metadata init,
memory setup, and segment loading with no PAS context, then calls
qcom_pas_auth_and_reset() which skips the shmbridge prepare step required
before TrustZone authentication.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence
with devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), then pass
the same context to qcom_pas_prepare_and_auth_reset().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..6964395caedd 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context *ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,23 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
+	ctx = devm_qcom_pas_context_alloc(dev, IPA_PAS_ID, phys,
+					  resource_size(&res));
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
 		goto out_release_firmware;
 	}
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0

