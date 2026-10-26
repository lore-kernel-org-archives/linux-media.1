Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995895;
	b=kGeZtF0Jibdf8laJdJTfvQDZuvKILRmqtbjljs1Z71na7+++qP9JtTAQPGjj2gq2gJNG
	 ktjBSrFMOIHLjMXu/RiIzKm2CILSLsarIlmST7sAzqBwK/D7rpyNvR8jCgUMqwvPk4VCQ
	 JJXFAoyD8TES/D72aOCP4KySYtO7YaYosviqV0pJ1HL0caKnjbRBDqqnzPCYrrcTSyn9/
	 zEX7TuBq6kq0kjSUfFSAxKnVQAdwmML9uoalnFYmxe5FLRc7JKZ5KzS5GR0GK8sJijrrI
	 ub0QXgkaW5oXvHKJkG3oYhteByc5OQhI+B32Y1NH4scInl0H7NLabe7Bex2F7l65icQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
	b=3ifTM+O+dguUiCz/N2zzYggT3JZLmze57oKq7DzFHXMNFcTNUTrswfE3LlOQwVYf7A5S
	 oNp7fn0zsiEuaFWhIGvYOdY9cjeSr99vQxHLcnkpFSzHmpdkIsHVFHGFdRNfa/rjXc1s0
	 wrcuBY8jpX3b2fdOKSdXMEsIOwILaIBi0K/4sVR60/ij4zBz4jI+Q/jsHcE6BRV83XUYa
	 ZdNZg9J+SPliRt45BYysxR2VTfaJdEV0L+O8r4DTo5vl2JJRBqftlC58H+mIEcjHXMsNu
	 Q0U09vdp0EQgNnqkgDp0EQ+gmjso2weBGvaeymi7sjGhbS24MO/82oK6uteW1DPNQhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfO+XRp4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pmraj0p3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505C5606A31F
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505C5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RfO+XRp4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pmraj0p3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4af7o2222806
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=; b=RfO+XRp4pjYRM/xe
	mG9DK22XFlQQwhgLDBfJpX33NFBxj96FU7sl8qDGu+Plw5ex5UktXN2OLXZEcPB3
	lug8o00Xm0AzYhEad9Za2pih0Tbw5exLhKuoCnzPprxIuijvxz4zLfEKcFBfYNBD
	f5+Tb9YCPNgaxfkrq7X4qHuv8gdHeoQw+OyffCNvt95dE6s1lAH7r/ILD/USzVUm
	nwszRM9GZvSc0tqFQRJWBBDN6XG+UW+fGRSaExZ5Y1kMG3hd6Sy/gqDES2f0V+mA
	xysdEC50+zKS6USAkgaQint/7kg0MWwL/gfkLauR2rgrEFrK2k/1zcZdMguReItg
	yLnhew==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd8u0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:24:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9501034c4so50082615ad.0
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 23:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995892; x=1793600692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
        b=Pmraj0p3jc+XiKtQWDf6kGCYzkt+NN1PgXCH1bwT2RHr2fJCk0bvHCoMxljqS1Mh1b
         gRnnjLQ2lSJqfdThDi/IPKnoj+Mytx44S4S9i/3DpQyImieFeVAg87pmKucofPl6eCmf
         mIvG9Bh5gdHMPtTfwD+g65xWUte1ZNZU+lyc3vo3rBtGDpAvzdTez1Se6NwXAsd7MH2s
         DH4Rwrv1uTiHwGbxTi33dHs+NiHQEYdzkPve1eH6QUeNCDXDsqMktzPHh2QN7syNP6WB
         W3daK7/EDZrbwovBrZyGeypexIAPXzxZj7MNxdVOqdQlsN4o/GbqhbRrIwb/BqDC05hO
         w8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995892; x=1793600692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sy6FxDMRvFjw5nCdumQqAFyqQkzByWzKewADskjDzko=;
        b=t9lI7RBSb+eB2grC66iLxt2xvHP7oXeP2Mu8ZsiKFfvbNEonb6d6CXPXusH7R9S1ns
         oWBLlOf6Soz49hUEJyUO4PjuUDef8Fi0xHlj5r7ktPHa3cNHbFbn651TNZHd5TewMu59
         LFZyY7wgDtXPqtpaRNC5BFub7MiJUlhGFfr4bVoXIGuqpjowpiw2fWomCbQzcCmfv40h
         pYNg6MmM6AIHf+D2v8MbCXX9/iFqXqM9W32cSSbPSyOd9gYoZ9AL9MYBuT0q6Ky6frDS
         uwJqI6JjAEin+azGlMghedP9egBWGlpk1EyCaCItocq+icHUaADntxbL0r0fS7L5r0YV
         9y5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzyfrYd63qm6dsjpcNpUzkkf/721xn1fCP6HURyhreaf38vFEQZpc//tKUPz7rf3Z2ORuHvuY3ecDZ2GQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHQHr1Cs18EYMnP/LWtI5kQVlZUkctTtfB0sdlaQ8YYK15F32p
	kOEKUfSVr0vhDXoXIefu6sA8L6b+eCxzOj3mxjmHyM82Y4I0GhPkbkUBS4l4sOmSVH3sn62uGfY
	yw18fUMlvHHhaskFu6jm9Sg311as2muqnEbPpN388gkE2Z9RBwOGfh8EJ+Hefqr3gVQ==
X-Gm-Gg: AYBFou3Cs+cHjB5/ZJ6hUXy1uFEgi0e2Y5TyG60fVOCugsIpzx3McHJ1gYArxk7CX45
	IeYxYzR+IOY0+wRTeoaZ6OpxcRv6fWZLl5EfEkH06e1eupiCIxMBjRhbHQgcJiFUUc5S4Gj/OoT
	PLEo4x3RQcAuzJ9Ntaeu8ZIXekApU4co0omQvbYJzBdLkF4WS0uIULK1ngAGjyolltZPzKlAS9f
	UPnXsvdfnqLFzmWJFJksv4bWmZfNn005Zm5UV2yC27ph3hxHbRKceByEEOMUAKIsiHp4CLcxMKS
	rPoWMcIH2UU+s8qwhVjWWRN6jqi9M7fDumhwXrTy+K3BFHoyAB29fqApEOPhXjIjqDHnxf5xq30
	L1sV2DbLElqUAK8kkON8HunZlokyMDL5Zrg==
X-Received: by 2002:a17:902:d4c9:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2ea9c8ebd4cmr50093245ad.51.1792995892301;
        Sun, 25 Oct 2026 23:24:52 -0700 (PDT)
X-Received: by 2002:a17:902:d4c9:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2ea9c8ebd4cmr50092955ad.51.1792995891873;
        Sun, 25 Oct 2026 23:24:51 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:24:51 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:28 +0530
Subject: [PATCH v2 18/23] virtio: Add Qualcomm Platform Services Firmware
 Interface ID
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=888;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=OlbpUMWfalcU4LvUc4XxjyJ0N4RsG6REGtg5lYpZB2g=;
 b=hqaldRzU9Cfrh8WAe0bLtlXt2+O+xAhC8XiFVF+11GcI+fP7EIgtkw/lV0bwk/zrXWsIWG3i6
 OCdlUUwhFkECpl0mDzYq/rh+5qzmVsGCw0XRLE0D382TWK/dkx/0epo
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: snDTq-IHb8e2kr2DagTyosXBoYqdaUPT
X-Proofpoint-GUID: snDTq-IHb8e2kr2DagTyosXBoYqdaUPT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX9cc2n1RRG8J9
 R1ROfZEsnRiEozB9kqH5OuJhbqAdF4JZyfwSevcUtb6G4+W5Ly8YQV+KvYg4NbHgP5NXk15V0AJ
 vSJbpvOKMV9jLMo0Lde0/+Db7sWB35+K0UqSE1S1wReBWyc/eOj716wqhft6pd3rqHCR5uFn84F
 Y6oega//+fflGX9HGdcUaBSWxUEJ0mPymKZ+2ZSjNbJj623RQbi0orPie/eLLZuaDai2bA5W0a3
 lYO7AkUhxY4Hi8DOHhcdpEFHdoeOte7u1af5KJaWG0L20ljDlrxVyQu5HykwNS4G6dCsYNonru4
 Rg/IRl3h2IlAFYmXrXyQed4SsNCCqquQdavZmrPP5DSbGTgim2FP0JuB3/Pw1Xhu1kWB+320j2P
 rrtdflP3tzWebvFeKeyyoYokAhGG67DZScyPCqXbchJuewMLkIQrKup/9Pd9O+axRyqbCj0+UBU
 yMaAEZwPAsYhnz+h+fQ==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adef235 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WCyPByqoPTdveakBLZ4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXzB1EPNtOty4t
 VOxVs0Z/nk1HtAsKAaOk5H7xmTa3utu/CJVugpUbhrTxtjTFbaaLQACjBNv+U9ZNgc8MMgNrXda
 EbdLwjIff2K2tDvcMnHAT59SfDOe8Wc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025

The Qualcomm Platform Services Firmware Interface (QPSFI) is exposed
as a VirtIO device with device ID 52. Define VIRTIO_ID_QPSFI in the
common VirtIO ID header so transport and function drivers use the
shared identifier.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 include/uapi/linux/virtio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index f9056af0c622..6c6f283733b1 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -70,6 +70,7 @@
 #define VIRTIO_ID_GPIO			41 /* virtio gpio */
 #define VIRTIO_ID_SPI			45 /* virtio spi */
 #define VIRTIO_ID_MEDIA			48 /* virtio media */
+#define VIRTIO_ID_QPSFI			52 /* Qualcomm Platform Services Firmware Interface */
 
 /*
  * Virtio Transitional IDs

-- 
2.43.0

