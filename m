Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2BC445AD3
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425187; cv=none; b=eCFhs8/BurH1XIU0zPqukhg+dl4xMuIGdnMM3AUdmksXYw15//KX6CNc/c/5x0KDlrknrloPyZ4g9h0IajQVUpyVU2+PKEW0Q4nh8qhD0Bdb90I+XxT5w9pk3Ez9Y5novXjobEWQi9TLml/HwnpDEMKcfMvxjlPTDytD3H0ftXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425187; c=relaxed/simple;
	bh=ZMb8lLaTR+mP/877LkTeBYFygNnlsilRnPTV3MQwVlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIJ3R2X+cP6804U9ytW2Vy6WahfHH/xeHX4Jo0yATiPa8nCezG5t7o5YLTnSevy9dY9GGP+4EuTS7wyfRK9SqkDpU5RxKexeY4qB/7YC0spOQu5fNIlHYJ5XQcXkT07szECrqXSZwEpv/4D78z4EYkMJHPVqVy70aGeI8cCBw0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ac5Dy7N1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ce6hXUa4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ac5Dy7N1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ce6hXUa4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEf3Nb1036674
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/NwhDmhfnD0AhF1yGd7rcWXKmCXW0KCaswzXmHdXq4=; b=Ac5Dy7N1wCF6g/Kp
	7++8fudUwN+n3DqfkrdW50FgDbxJvAHV6jG7eGNKSw4+wqnJKcrfDTkAz5aeE+1R
	nCfD1VZmvIaM0lH6OO5JzhK5FtgRPqvdNLGIiKwsq2/3LKKjomsuAvs1oRNS5V+0
	19KFbKkI4p0/GyuM6kPl50E3amZyaudORXdDcZ0zZpM4zyt6FKigeAq5emfiOsAn
	KPjadGVBx7MCgg2KHH5c3Ayh9AgX/Lw4ggJgrNE6C/PimamZTFzyKDvMGrQkWp3x
	mUEdiqc9R+SaJv78sQETEwbFPoTpkTtYVe0U5908KQgwg7qkeRf1qB8Wzv8qs1yc
	IyN69g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8k608jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso12563901cf.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785425184; x=1786029984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/NwhDmhfnD0AhF1yGd7rcWXKmCXW0KCaswzXmHdXq4=;
        b=ce6hXUa4LNG097zJuHb42FcIZ+0izJ+bP0JfPQ6wjVLXtFQm/qvs26uT47WRL44m/o
         S920v43/d2ZXvuAYiPOaSUKXNin7McVMweoJ6oEse8Znl57aJ2W3B1lUUaTD1znCPY4R
         CCg+gNuTv4fw5NEoe/dxnQ+FRvGyZAz/D0aPBKt+fpiQVsrUFMKK9hUFyZW8hcJ52nJ/
         BS/TqJGXzXJQY/dCdXdvt51bYV7tfsST9uN13JkEP7EZ8mb2IDqL2DixlKEk4xALokw6
         p07ZrHJSfSZcZaMDwef7ORQGe84wih6xxUkRgLUPtHyfvrtysBZ+KeCI6niQFXNy03ge
         JW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425184; x=1786029984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/NwhDmhfnD0AhF1yGd7rcWXKmCXW0KCaswzXmHdXq4=;
        b=XqbG5PsX7bB0Y/YHV6AWvwIEutdKlokYh6NLP7OyWQ3SBEp0rhzQPaknBAj3ijE5ob
         CKH3Cp//gmHzEAxCVuPwOFhAg5RUu+3xM6gCa7csDqltX2GRGrZKhaHZlQ5wyEbWnSoV
         5hX2DptPcnWgn+9+kX2bPQVQgtIQrgvJhFSFg9S05w+t7Pz+NFaDfYQbX2ejujnq/s+j
         lZbCUhj2spsYmGBF/z65lrbxCp82ovWh1GIY2y0CAsSsR6JsBdUYqABc036cIzlFRrAv
         xN5+N6BQDlEgi96NQi9zea6nBpoqnmAo+nPeSNedgg3JhuL72TLWDeq131n5GM+p6nmc
         8D0A==
X-Gm-Message-State: AOJu0YzeqKE0GOz0oHTzmI//l/umANnIR30HyMIQFPgZHvJSpSkWS+hB
	EgXYmVbxQB9z0EWPp9jHPpjd81l803jQPN6POX89itosJBQnJXIs7U64eb7xNSYtxOYtV1i46Q4
	42nucIX7AUE3Lqr2m0eBmaTpZ8UYp6GNWR4NkdPdEyXx62DweNUa7koRYAjCPSdKAFlZXTVhgNQ
	==
X-Gm-Gg: AR+sD12dQwQMT8LLarf8XNzfNtai34euAqOYpmMlbwVl/NWUlIWU1iosV8cpD/J7Z1n
	AwT6u7/Hv33iT8WqnXVHLBgIyYFWFdVPjad4ndbdx/3PklUWzgB1g8EQoNp2VAcINf1JrtN+qoe
	A7jt0FZPpikFVj1S8Cj1KQgdAylfSxUO+rIcmMnWhPjUXR8xMPaEnHtcXwJc8FPVsSEcmCk5XPm
	LRqCkKLJ7s5D3lOMcKbq3NREJFmnxI8Ayr7fxN+hF0W2AFP8Wcj7E+f1UWLhd0gY9wcThwdCoIy
	14sP6h6EdSEPnsjG7R6+7Z3qJ9B8zVJ6DabLrI7mv+542MEv88UziiEu/hREwoHEtrbVCSZ93Lk
	Vd7nyXGMnzM8FEFWnE4yKqZ2RlAB61IrSIL8kVUzmbXKB+qyvnFMeH2vXIuSNLtONyFt7S1gUrp
	g4nfkjog12s6dNlg==
X-Received: by 2002:a05:622a:1f86:b0:528:2709:5fc with SMTP id d75a77b69052e-52b426187e9mr9886821cf.35.1785425184168;
        Thu, 30 Jul 2026 08:26:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1f86:b0:528:2709:5fc with SMTP id d75a77b69052e-52b426187e9mr9886431cf.35.1785425183644;
        Thu, 30 Jul 2026 08:26:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ed57asm443160e87.69.2026.07.30.08.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:26:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:26:11 +0300
Subject: [PATCH 4/5] media: iris: reject open() when the session limit is
 reached
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-fixes-v1-4-413d6cfaa8ca@oss.qualcomm.com>
References: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
In-Reply-To: <20260730-iris-fixes-v1-0-413d6cfaa8ca@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2260;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZMb8lLaTR+mP/877LkTeBYFygNnlsilRnPTV3MQwVlk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGprbRKh3InU8pERHquI3D8AFbUYqDMAGjFT6lOY0IgiX+W8N
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqa20SAAoJEIs8ij4CKSjVp+IIAKL1
 b0YaI1NiSNRlJX4MHVe920i2yNe1pnYAGCJk4gLeEhkxfKeIua4KZwcKChpS3tTNIk2kb+7MRr3
 OarWZv6NNKu6qd6coGj4k4XCcaKfC89thYNTGmYA7cqnXJp+s+g88/RFEjpqP88eqEQd7w/7PNP
 HdGCiX3kOKzRZP1OsSVQE1PpbvYQH84DJZS1psEVpGKtN/P/4gm+Mjobd2+L6T27ylU9gXZhrZ/
 fW5PCiK23fy+kGtr9yT1F8qTkCFD+7e8/EJT1pMeoTlJnJTTfAiTEMEtbuSvJBAp+yxp4T32r6Z
 01/C9XlYKaa97b7JvD7gLidG/Rhn0yGSXDpg0cY=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: TRO2fShoPr771Hg_Kc8nzbLail2aOUm4
X-Proofpoint-ORIG-GUID: TRO2fShoPr771Hg_Kc8nzbLail2aOUm4
X-Authority-Analysis: v=2.4 cv=Wqgb99fv c=1 sm=1 tr=0 ts=6a6b6d21 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ndlc9D0_b-mY3rDv3OwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX0Wimb5MMtJF0
 PYEfaoUKK5ngA93gcqPiVlaIAx5bntsnZkzP1I1p2tf3xmwcdnWjfFPVNQ6SxNFzGLEWhSRRWMJ
 AkBPq0kOawVs7gJpbJpS4HBTDPsIPGHq4hwbzG9Id2Fl5S0/7PLZxUfSpd+8ljyidLjTl81Ioqa
 n36cp4D34lwqXF1am/rZmMMBSGMca3anuTMpH6ambiqcVI/uxJ5zAZy3Yn7Sq0jgN2iDX7RhYnN
 4UzN669GKBfepWx6YKuqbwdrdcb9f4tLng2VYYT0EH43LnZHB4m2gTSyrNQYfIgKWwSg41E2aOP
 QqmHqwj0FillRS1Wj3yk71UWu5i4bb6gxAw6thfcjKHghInu3DW04YDY5Pbyq0XDFlFrGVr1u+1
 cIRpjUYXET5I/h/fvGguXlKXRWGNzu/R6bJuNIn4dxScf1nrXUenHMmxkMnRD3XKUNJ/7jwqTDA
 1458WewPACwfgikLzGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX5D0yPrCglrkY
 1Z8J7t5T80uirYqG14DXFcmFP8It9DxW3GCXj3LJXw70PiOGPkandHC0HuSDPkG+X1wZeGHESyO
 VCN6PUFxRkO8gdNSwy6fIss19LyJstY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300117

iris_add_session() silently skips adding the instance to core->instances
once max_session_count is reached, but returns void, so iris_open()
continues as if it succeeded and hands a file descriptor back to
userspace. As the instance is not on core->instances, firmware responses
for it are dropped and every subsequent ioctl times out.

Make iris_add_session() return an error when the limit is reached and
fail iris_open() accordingly, freeing the partially initialised instance.

Fixes: 38fc8beaba55 ("media: iris: implement reqbuf ioctl with vb2_queue_setup")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 14d63dc76c9b..b68b98f02e26 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -39,11 +39,12 @@ static void iris_v4l2_fh_deinit(struct iris_inst *inst, struct file *filp)
 	v4l2_fh_exit(&inst->fh);
 }
 
-static void iris_add_session(struct iris_inst *inst)
+static int iris_add_session(struct iris_inst *inst)
 {
 	struct iris_core *core = inst->core;
 	struct iris_inst *iter;
 	u32 count = 0;
+	int ret = 0;
 
 	mutex_lock(&core->lock);
 
@@ -52,8 +53,12 @@ static void iris_add_session(struct iris_inst *inst)
 
 	if (count < core->iris_platform_data->max_session_count)
 		list_add_tail(&inst->list, &core->instances);
+	else
+		ret = -EBUSY;
 
 	mutex_unlock(&core->lock);
+
+	return ret;
 }
 
 static void iris_remove_session(struct iris_inst *inst)
@@ -203,12 +208,17 @@ int iris_open(struct file *filp)
 	if (ret)
 		goto fail_m2m_ctx_release;
 
-	iris_add_session(inst);
+	ret = iris_add_session(inst);
+	if (ret)
+		goto fail_inst_deinit;
 
 	inst->fh.m2m_ctx = inst->m2m_ctx;
 
 	return 0;
 
+fail_inst_deinit:
+	kfree(inst->fmt_src);
+	kfree(inst->fmt_dst);
 fail_m2m_ctx_release:
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 fail_m2m_release:

-- 
2.47.3

