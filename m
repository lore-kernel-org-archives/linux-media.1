Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3DA3128B8
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942078; cv=none; b=Wly+u/M0ubPYmWDLgXfTpzg67PjT0hQgJZ2qObkSq1mpMlP5ZaSYgoiJoZZOrWkfQ6zU0j3Z89/lfklgHdsoG4W9U5gxK8mJB+8a7J4FzLg54yJkIKGr2/+cC0+TFsClTzPa4HLPsTAZAnAN/bv+hN5FSKu36u3cmv/Uarh06pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942078; c=relaxed/simple;
	bh=1OHxMv2wBW5/+XF2J6E2XUpLe6qHFrIRQAha7890YB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m9DGx93emIzIbDSMvcmXtxayeLu23Y7EUBr2fN+0gD7xx/9PidRlzM/ZXPpm736mRO3k+KVhsNlCnJpfReCDj9wbDe8AM4xyT6hIIZqRfSdBjL2i+zFAYGnERoAObgsizWjuzA0jtvMjMPeM7HcY74vzgPvjZmLhDsAnDjoDl5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALHMvmZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LwJvY9WG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALHMvmZ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LwJvY9WG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCN0C4058250
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ts9F4LI3Qew7SgAApfg24zoA58LocEvNJeGMCkgto4=; b=ALHMvmZ6t/9PwqYJ
	3E8YSg6h4Maib+VpEguh/GuwaJ2ct2VBHS5pjl/rFKMMsuha1cwpHUvR/rwod2ax
	jjZa838V/LMZW/UKNBF1isRV7Js3CCzFofqL/OEBQirBdhlpsy+63MWXwjoui9mH
	Dn1uNa4geehPCbbHVVkRFZvvuyaAWtmMr2DnTOdouX3jLIi/1kLf+jwhqhIP2lgy
	Gb+FNOCtmu6jpZO1t0LKG2LBop6d3IBaOxuAlWf50gYi7smMKIYEk4HsgCZ0qtzh
	qxCUQGcdZi9WSwSZZsxon4RsHiKdWWoRLfRksJUEi/vsrJa71VLe+6ObtssiQBlL
	q/mkjw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2hd7w1ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:47:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8487ed7f7beso2932525b3a.0
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 21:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942076; x=1787546876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ts9F4LI3Qew7SgAApfg24zoA58LocEvNJeGMCkgto4=;
        b=LwJvY9WGL44mdUT45/m1auL/CO0H6WbGYQK3rfz2nROW9PfdBMbAc8qAfKlVFpGOpw
         24HQg0mQhzQGrr3DOhJoQSbOCkSl0YMt3GE+HtU2F4rqa/fhlfYQXzQMTByUSL/4xWBK
         Hc67PW3kmGqMNp+6LhmGY5JMGTzL94ZXHAsDMxjuMg+b5SXkMr/1Pqg1w5N4lgMTeoZT
         R6X8/LcrAsPmPGn4WyMYBqoYbN2blcdSsM/TFS/ySd0muVfWELmWHCcU1XAX2HKvk5j8
         e2v13Ks+RvbIORdYZB+aXkJ7XyYKAaIuac3Z66ZCfK233Me28u6gC5x31IlWokH1JENB
         bVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942076; x=1787546876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ts9F4LI3Qew7SgAApfg24zoA58LocEvNJeGMCkgto4=;
        b=Uw/L/aIDF+sciZ4pERRicF7yBxuqWNBIYeQqyX40N8ZT+IBoZME+GN1zbB5M1rM5t7
         pBSBQTfdBYBOlK5ZOZE0ULF916Vv+UA0gCDolXah85FLihUmiQO8uGBlRAcciIw3bIW+
         oFeM/GS8Afzb/UEUPB7/u4x7AT/vjVJIExTJW/iPoXfTu7mJcnrkPWVz1pa8xxZXUU3G
         rlYMZuRQsjClMs51d4rbGgfnLYlTiM3jbxeVs1t+M8dPmmu2fU/JzlXgnr973q7BFqUY
         TbxXAhaDUTmScuVMXJgXo3ZrJzhsS5hnOUZ0BtmzM42O0550SdzArk8GPEkG8HnzIDrs
         cNOw==
X-Forwarded-Encrypted: i=1; AHgh+RpmuLPtO8fiE4mXBR7AGuQMn95m96QdHJoC72dy7szyQXYoBQ+TI6WmhRCOvj7cB4rYpZzchGAjI4cIxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0oRLa33JQlwyitwy8djkDVOTQEhrYQJTfB1HkrRaRspQ1TpW0
	0/2X3PMEVUKBKPHJ3n4oC87K9d6CGHv/u4hUNuqFVKoQQjY95smfPcbaNOpcjY78YnmdzBKA9Bg
	kZ/Qe4KTZBCAqKwlx06YbkXWNKUmq84NS14PJw0QoC265J5YUXGr7zeth8vi55xXTUA==
X-Gm-Gg: AR+sD12jluk4D/34bydPM03S9v4LJDliM4M8WPCCE20XdSmKwj5BKdw8kvr3PSNc0sI
	dNu6uSN969hjylqmMjbhF5jlbi0CrATreDyc0CHHP7nQ+idSyQnsHiUlz/f8bprmqshD8zyswrj
	TcRXX83vX2U519RK5avVOig2Xs7Gw8pkx72840IXfdjDa8YUnt2tfyw2fkbjR0cSzCXCr+bb5BQ
	rro3gLoKaqJYtO/sAOUzZog5QSeSByKDRd3vgTuNyf4ybrWbGAGr/U6PfOGMnH62EdfRm06aKyv
	fKn5vxhP10btCu2lEfioq/D72os2yNJSK9dcAekWcG9RXCZ+QVctMeUbuaNc6MtOBErn7Ni+To4
	b2F5Ieoms2RcLpFDP9w5afDRFruoPsMZy
X-Received: by 2002:a05:6a00:8086:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84fde47a4c8mr24275347b3a.37.1786942075804;
        Sun, 16 Aug 2026 21:47:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:8086:b0:848:7731:d95a with SMTP id d2e1a72fcca58-84fde47a4c8mr24275302b3a.37.1786942075362;
        Sun, 16 Aug 2026 21:47:55 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:47:54 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:36 +0530
Subject: [PATCH v2 01/15] MAINTAINERS: Add entry for Qualcomm DSP
 Accelerator (QDA) driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-qda-v2-v2-1-69a02e9090d4@oss.qualcomm.com>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
In-Reply-To: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=1175;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=1OHxMv2wBW5/+XF2J6E2XUpLe6qHFrIRQAha7890YB0=;
 b=HyeeU74f3CsKVkGnmRyBHt0hVqLHg6pHSrSomMARbCMj8ww1CDL9Y/CwmryCZtNpCOfURrc7T
 hBv2bX9LYjIAjAhLgISSrFUBT4+VfnI3DUZj4hbuPuy/jsdJu5xv35r
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfXytfkdtlaNF6M
 8tBW5ngI2wm6pBa/LWTo+/eTggX71JMPKoXNTiZ5zLQbsd+gonmi1W6CnBwp4fsY28EkI17eV12
 N4JE9t6G3DZYf5OD+F/2Nf9JnrezLkIps+dH/sms3tW9q++fY8taqk1aLYkr3BfuLmAAdsMI+Kn
 dlefWbNK44THvmreo6eHs1jggT5R+QnpwMqZXIw+Y3LK8Bu4lDQEu2jSCty9D3A5iWBWkjmjxPu
 fxMEgalmrHLrelKBEVLMQH3g8hBIklUI/Q4bPMHmOPyrdIqgOYwhH3XxzwkC3apsw4/PfbL6q+r
 K2RGiHDxN8x75MYJWA7N8x5n7mLxxogitnHpd089fgc4MxEH/yEoHlsZmRBJx/SrOzLRQ+Itkw7
 w9yRBucWP48QYSk+mT0Jx8OXaAqfO5mJWzd3tisBJGWkkMyjZN1Fqoqn+UHCdhz1Et+YHIEGYt5
 jsmDKhBvzzS+YY0f6Yw==
X-Proofpoint-GUID: _eBax57BQa6UKKhwmmVfDVyADqy58zta
X-Authority-Analysis: v=2.4 cv=Ja2Ma0KV c=1 sm=1 tr=0 ts=6a82927c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-nEfFi9kuEQa9ToJtW0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: _eBax57BQa6UKKhwmmVfDVyADqy58zta
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX2mnhHvq/8BiA
 Q0mqeBPHbYwK+vALXXoenWsJnknR2X9+ZLVtWsE4Rh4fXlMNVUnTRMUVVzpzz56wsm8Ea59ADTc
 odPHc7svhocCbj+JKB0jz7fEXhyZbvY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170033

Add a MAINTAINERS entry for the Qualcomm DSP Accelerator (QDA) driver,
covering the driver source under drivers/accel/qda, documentation under
Documentation/accel/qda, and the UAPI header
include/uapi/drm/qda_accel.h. The linux-arm-msm and dri-devel mailing
lists are listed as the relevant review lists.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 912837dd4640..75fa90c137c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22388,6 +22388,17 @@ S:	Supported
 F:	Documentation/devicetree/bindings/crypto/qcom-qce.yaml
 F:	drivers/crypto/qce/
 
+QUALCOMM DSP ACCELERATOR (QDA) DRIVER
+M:	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/accel/qda/
+F:	drivers/accel/qda/
+F:	include/linux/qda_compute_bus.h
+F:	include/uapi/drm/qda_accel.h
+
 QUALCOMM EMAC GIGABIT ETHERNET DRIVER
 M:	Timur Tabi <timur@kernel.org>
 L:	netdev@vger.kernel.org

-- 
2.34.1

