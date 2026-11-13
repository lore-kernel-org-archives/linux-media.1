Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596054;
	b=cW/+fGTD77+sE5UXDq1juqiXirQWKrthkNFuOTxic7xd5/8lWo5shKVPgC0QFHVScXT+
	 J2Sj8wkm9kPmTtQnvqkDM7sXu6pz0unTrUzE/M7nb29fJJHVA/2hAid527pbstwqlBDUx
	 e7k/IC/dPQFar85wrnrh0gLye8xW7OkhTPmV1RcT9ktPF5dh2GONFiZcKwxeE+7GHAQfa
	 vy+2t6a0WgejDaovgATY3OpJFNIqa+UtvRdtxTJFD60KZyHib58vsDermXJglBGZOmlyL
	 Fsp+mWFvHU1xm8qpOPTW8CUzXlpIfGMQaDux4Vv64yJLf4lz3K5t0AHznFeHS0Czymw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
	b=CrcxKdCYraSikgu+rGWBrdEA+ke0Ash3n5te6PXyV1/0th1f7ezIwqx91GOHeoHPCuME
	 8WLpuPGCWc7CMakTPGL1j+mVh7Tw4TYFnj8oW6kxwkFOxlly0NLnE4Plh5zxd3swqHEE7
	 HKrHY/QAkzVM9zALbZhUv8XkF92UvOJpKneMVCH7NqoLeCyue+FpTQYR+CQ8HNa1qHUcU
	 CSqwi5kjT/5k3S7LvIraNvXwy2U/SBGLFcQtrKGHyzQcNjG2nnMJEdi0STTQpKpox8Acl
	 0JPakBG49+lAs5vkR8x/MbmpOqLBR1iatvLEvBn3zonq14jv26W8OtEFiNLCiSXriag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQLzIrhS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNDsz1Br;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05B560A261E
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B05B560A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQLzIrhS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GNDsz1Br
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5FQ551880
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BZVUNIWMPuP
	DdEXUHU9zeRI/d11l8gukZD6tZvmKObo=; b=cQLzIrhSoij3Q3A92ujCBOk6ye4
	qmX/+gDp3wbXyaXnThiusMCKD3rVDNtY+4fr8xgyTpKSDW80LvkXAURGHSV25zed
	40dcT1HGZG+naWL+HVAdRSr3QovZKOb+WzNFyd2IfkBdjqdlD1S2oUQpM2GFU6tf
	jOwA4cYLo6OHq0gKz31H3gF5giQ7IhWrVmt2+S7bYLniTn4JqG9BqLikIlUn+RTo
	r8B9Rv85nFDqt9h7zPqSc9FpscA9TNPYOv6GFVawa5StM/DnjRgjX1GykyPffIG/
	fh/LWgFda52/cqPgn++nPXffKiObpwfDeLL+OI8dz51iCIz3A1OFQlHn4hA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwcc59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 18:54:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so769915eec.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 10:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596052; x=1795200852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=GNDsz1BrswBSh/IYDUdbKQvcjXkD6p2ePaVWazbQLqgv5suTnG6wFkvO4N+LuOYHSC
         R4pS67i51jOV6DhHfSTnpYjPRcXAH0n6Lp89CSYRH0yR9bW12jtfNnkLgx6eyuvlOtF6
         BYVw450h2NyKR4X9EhSacVxNkQ7GlxdQ9fJGliTH4GVrgRazRsNOBAhtR42yKKvBvGwt
         SIL/2evaXcZrTbkveH16FYWikopVMHqCriRwy1MiMwvDXttaPrPZLkoAstWbpoteL4Ii
         2ASyNfmMT4uHSzKF/PnXGUK/BgQl4xfW69boUfY3l0Cxl8pv6EfUeEzOrw/iPrI/LX0v
         Vttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596052; x=1795200852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZVUNIWMPuPDdEXUHU9zeRI/d11l8gukZD6tZvmKObo=;
        b=LOcUvk8uR9JOqIF+NNyV8EfnCIKbwpSXfE15B9Sf/BZJTNWeG+bJrekkWcEBanlhDc
         DQbG6vZ4Dc447K0c/96QayjyblWzzGqsg9QT0IwS5Zkri5pGKEP95lQfM+reIRo0m5Q/
         blrNBnGsh4YnVzd5qqKv0fzkO05vWq80bQuvrblEHZ+/py2HYBpfamxVPcoqpdb/dmQM
         aWHY9+3XcYCQv0eIODsL2XA5nt85O4EZRy2l9pazcYPvbTDqCzIM0vftkzTgWNd462nI
         gKCt4resvle0fLnetH2rAHfyXwmjU+0bTbAwBOfCSInWJ+J67C6pOBFkAZ8AmkiTx4XS
         QLWQ==
X-Forwarded-Encrypted: i=1; AL+hErFrMDQiKbt8Qj+PPIiYcKZeCNoK0cU4xneLZH+fdf86ccPxgBSkb3b7pBvFKrfz/J3HwGTq2QS+gFTdww==@vger.kernel.org
X-Gm-Message-State: APuU4Z/xNvAj59xWKa9bOvTBBCnywNhZ48W+wh9HkJd9Z8Eo1qQAjUzo
	PWDXSbaO6a7JZMnFG/NNhREzeXuyFvWGN17WFAFvocGOpdeYFXeidwjSUlZjDcqJHmlz8tYpx4w
	L/XSNtbXggMrpZyILQ3BInUKhCwhOvWRkWxmPKjbWZ3Uld3Z4/xys0NZrNbtTi5usHg==
X-Gm-Gg: AYBFou3j2Aq2i+rrPGRk7ZeI2lxyI4L+Smveh402Q9D6pwDN0ye3vVtqYD40HN0y7U/
	JQx3Y6N3xyvQJZs1NZSI6kB1K9Yif7NWcADkQ9ZzRPQbrz74rOnZbM25rF9RziMH1GMCwdUVaVW
	OlpuSjcCAxcjrAv1PthT/s36wb5CSWIczk5gPd7DVgBoJ2ZHTs4LtBUp6E/U3ro9bOix8gaEr+V
	/mGo6Yf4fwNGV+KG2Fp6wUXBlAx80l4AsVQYCG7QBVvUMkWnNJ8sIuMAEOcneQOvPAN7hMTVRYU
	lhCIp5ZH7/DqJsyUrYEGGdlMHlVnHdJNtByrFa/udyss3AcVkhxF0ZhYhQN9JKUJxuRTn8rWUsO
	N+OZnfqBX16PjVnQjkDOmHrXscXF8Ug+Iw9SFC8vLdojnuQPOz+gc1Uk4IS51qrp52/6IC0cAGE
	M=
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr5885950eec.13.1794596051433;
        Fri, 13 Nov 2026 10:54:11 -0800 (PST)
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr5885896eec.13.1794596050515;
        Fri, 13 Nov 2026 10:54:10 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:10 -0800 (PST)
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
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Alex Elder <elder@riscstar.com>
Subject: [PATCH v2 6/9] net: ipa: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:06 +0530
Message-ID: <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af75cd4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=ee_2aqc6AAAA:8
 a=EUspDBNiAAAA:8 a=P8P2WCEqvqb6tQ3B-mUA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: 6mk5zjtMGHSjSybTlbhhQLtpcgSHDjlE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX1Sv+MD7nedVA
 C7K6lasnBfTjHrDHN/eR/egf4d+jrUHOO1QB7A0vmKCwEOrMpOSsgjXnJUYyIBBsyqh/gh1WS6d
 pQmT6SeDXHs8ybKn4psJ5BZH+cAkmp/AVO9JeNwrOL47Z/nPCkrUs6Ipiu+qCqpVB6/wtDZPseJ
 W28YvI/B+no2fwILvYXMHStGY/OkATSBj+bFbTC/utN6GIA39qaQWUPXFH2GD+Ui3n3I/HRMHWd
 91XcEnMGRMUbWvVQdgpDYvAMviaLwu1fXFRE185DvLyRJ3Ht7CM3uiAH1EERZZewzMj/W/ioSQ9
 Lj7eN7F6qUFRRd4hD0txd2o9AmrXnG3B3+YGxaVFu7Dy0DTIaH3/ayq4ZN/sTSakyHyVw/jcrDa
 01vJh97DIxxbD9rxP/NrqLyJ1tZAebfT2m3JS7i023O45i5gBVsX/pUFHuVGUbPr5g9qwDMXmW9
 hIc+874XKsTIYDklIPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXw8mu6I46KBsM
 ava7ocS4mL0JI/4hfrTGIy8LdPIVWTzpQE5kUEs2h6xoR4hK83Hab2EGzLAymHjtvS6RaNJyRRJ
 0O6dfmP4dTzdBx+/ZLA+sBuFnI37E30=
X-Proofpoint-GUID: 6mk5zjtMGHSjSybTlbhhQLtpcgSHDjlE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
qcom_pas_context_init() and qcom_mdt_pas_load() and
qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().

Acked-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 14ac2d2faf7c..0a37741c2285 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
 
 static int ipa_firmware_load(struct device *dev)
 {
+	struct qcom_pas_context ctx;
 	const struct firmware *fw;
 	struct resource res;
 	phys_addr_t phys;
 	const char *path;
-	ssize_t size;
-	void *virt;
 	int ret;
 
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
@@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
 	}
 
 	phys = res.start;
-	size = (size_t)resource_size(&res);
-	virt = memremap(phys, size, MEMREMAP_WC);
-	if (!virt) {
-		dev_err(dev, "unable to remap firmware memory\n");
-		ret = -ENOMEM;
-		goto out_release_firmware;
-	}
+	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
 
-	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
+	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
 	if (ret) {
 		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
-	} else {
-		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
-		if (ret)
-			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+		goto out_release_firmware;
 	}
 
-	memunmap(virt);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
+	if (ret)
+		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
+
 out_release_firmware:
 	release_firmware(fw);
 
-- 
2.55.0

