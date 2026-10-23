Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725407;
	b=Rn8h8rBkS6Cx0L88+zKsOrld+HMipk2isZ7pL8HHJw41iN26pe1NtDj+3FqHftC6oDc0
	 XL1S8/9qWRGWUM/GdtykPdBrNRYQz/py9kEQiUgtq4ExiTA9QPZJ7AjahrYRvbMZcyxSA
	 AohOsDgUKlD/eVbfV4RFq/fLWrFTaOBlZjr85flMkM34QRcV9mIERaAh7LtBgNgKzsHtg
	 JRD7v9DerZv0mmWvmqgM67xRdaMPWXS96dMRXd+ixT5OWqWu49G1q1ym9BcBHjjT2+74s
	 I1I9JIZ4MnNTanm/MkfL3cuLvipG2j+X6wFRBJ0inAyBlq6bO9WXXtdGCIY9XXmClAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xvq0tv9LAvfgk8g4T2nNFcbN/IDFtiOTOPum7364YBo=;
	b=VjOwXni7M9JxgJdAEHoLrQ+BOPv11Ner56OpBbOlquDX4IAGtdOQRozmhZ9inxh7xOP7
	 dkRerxnlEtweZK+mIiEKN9OYxlFB6jOtcncAr2KYk+bltKxD3+Qm0SQ0Y0Bea8HdxXMf9
	 DB6DqqUqQhnD5aRsqE9dAYLf8Iwx4VaDMkgCPa3AXoq8G2UQgbFP3Ric3zMlIjAYx9Xf3
	 3tElsX6cVe8EnklHoHmmwSH/2cebhFzdmSXILW9RhUyEQfPePEb27gWccvOAybh6ybYzt
	 aB5eSzFQixezv017YRm03Br/x3YwXshOoYOtDTdG/ritb/4s/GVRZevP4LodDqFvARg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWp1UHT2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eQKQmI3t;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56778606A31D
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 03:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56778606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bWp1UHT2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eQKQmI3t
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Etns2389423
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 03:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Xvq0tv9LAvfgk8g4T2nNFc
	bN/IDFtiOTOPum7364YBo=; b=bWp1UHT2MeTe+d70qpBPFP2HUINXGhWOinXciw
	CMJS5VSlicK7ebfvRcQff3QpextvSlyujLeC+vM0RHGiW0wVWjujFmK7g69M2Zr9
	EbasxSeciRuufRK1aCcEMt93pXDPKHSHHVuU+h3XvbG4UyVxWDZz8sC6uNrhRJA9
	7EH81NYVTLmJtKXv8nNjzXRbMzA0i+vKt9F2tuf8WJQ7wyWOi4Rx1KBJko+2CVrO
	vI7yqBCsJVhv6iiPoL6OOuVH1tkTwVGoBZtTtuKmHCgfa5f8QOc0CUfH/WHiJFNq
	fiK4pmn2qRBcFr2uRBLzXN7BpoZma8PqQbBy027QyIQkCd1Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmp9mr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 03:16:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-186c1aae818so1710354c88.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 20:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792725405; x=1793330205; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xvq0tv9LAvfgk8g4T2nNFcbN/IDFtiOTOPum7364YBo=;
        b=eQKQmI3twdXmw+v31npwo7oOTcJmjdSI9qGV7fhllMZyd063m3a23PQQxsMCqyBYhi
         hJu3kt9A0zpU5jp80tn2f65WEzRkvMgQjGC/a29iqVMNShsKyX04shsr3XlhdHo4EotH
         gR2AFzK0F/6C1p0LsPUeaO2dG8+2lHfNZ8zzHqo/v2DLHOrnbEh1mISOR4ac/BTwwCso
         lRt0/BXe35+JFYzeVYUnuqYukg5ey9I7g5t1768BMrbOldDXBeUQjOTtBPdUUtG1y/DM
         CQjL8lAPN0+AbLL/MZQjqUQ3jZwHr0g97LakFzzXydUrSpbracoIT3rtGhr4WnoLLQIy
         W5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725405; x=1793330205;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xvq0tv9LAvfgk8g4T2nNFcbN/IDFtiOTOPum7364YBo=;
        b=wnTvqzCGd3CBOoKnWlPeN0UvvWzxTLm+OM6C0MkeLUhaB8mK36uMDq5HqcaKmSIcoz
         xNLgHBQfI4LCr+7fFaj9lVb+ZqrRQIECZRwnjhZ3WZz9g3jFyxoJx/wnBZ5vBJy0mAMa
         fK9IdHbg5z8l8jKYhRhAkfo2F4EqAVJfUZV+8+2yFtLepmqc5iDOC8hQtN65bdXxPbV0
         laugGw9SR4k8huly3TexU26x1W3XzAxANX19yvXj10/cyTTnAVpGZrvfEcgKzl+sRg/K
         wD22yWTN76CHJLb+ZD52smm7AW0nzDcaNSPChpMYqZ8e+R1nDH6EO4YQRvI0DOIp1mNK
         hRBg==
X-Gm-Message-State: AFq9FYLZ8t2ui54m/f9RyNhjV+SHcu67/73yIjqM36B9Tqx++Gaq2Pe0
	JkK+TGLnXiLxPy83FYdoyGTFBN4T9JXbDKCtu+qx467rYNtXywa1JlQBSawFMaenEb2ET67a2A+
	9xEnbfKivFTnBd7mcIruwGFNgVdt2kJMoXKRP/JJYjEipe3r7l9U/oSqcXtCEm4GRLUQHgntu1g
	==
X-Gm-Gg: AYBFou3pmKzvTdh0xgcspYJSb7BKMo0eBt4xKLEnHP0V7uYGFgFgEaBD6Tbl8nm8k9j
	2RhUGMln1hKdc6Bpvl6rzYt+TmSSnKHPWfK54WiYSB64ZZNuNJ38vePaUUV1eF/rpVIItqkHQF8
	fmTR5/rmyTiLauMmn8/jnFdhm7+lAeZSGGRFhPzNymkh4W43Zo2ycy1n1XLoWFrPDaxew1f5zbN
	mVwvUl4nBUY8AzJQ2NM70USZnySTrmuW66NRuAPguycOOXvV4iYsnwWy026IEEHoIgGcA4ZtSXt
	Wo+ggL5Cp2q/bp+2zRFBNxuUn5CxLnJscLa5sGQKr61hR96tdS4NLjO0L3SXnVfh3QYW/quplaS
	ddurveJGIaBdEl275Lok6AyHPdaE9Vg==
X-Received: by 2002:a05:701b:2517:b0:174:cf1b:235c with SMTP id a92af1059eb24-195c374b393mr1403070c88.43.1792725404986;
        Thu, 22 Oct 2026 20:16:44 -0700 (PDT)
X-Received: by 2002:a05:701b:2517:b0:174:cf1b:235c with SMTP id a92af1059eb24-195c374b393mr1403034c88.43.1792725404193;
        Thu, 22 Oct 2026 20:16:44 -0700 (PDT)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e5163e64sm2374454c88.1.2026.10.22.20.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:16:43 -0700 (PDT)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 08:46:37 +0530
Subject: [PATCH] media: iris: add cyclic intra refresh on AR50LT encoder
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
Message-Id: <20261023-iris-ar50lt-ir-cyclic-v1-1-a81d7060585d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJTR2moC/yXMQQ6CQAyF4auQrm3SGUASrkJcQC1aQ4C0QDCEu
 zvq7n2L9x/gYioOdXaAyaau05gQLhnwsx0fgnpPhkjxGijmqKaOrZU0LGkjv3lQRuFY9EUoiao
 K0nc26XX/dZvb3752L+HlG4Pz/AAtJwKbeQAAAA==
X-Change-ID: 20261023-iris-ar50lt-ir-cyclic-ec24f4150077
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792725400; l=1711;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=uh9KbzTFh8CqA6ntGZiEBYDrRo4L39Sm+dHQNG584XI=;
 b=QoR97ve8BBTOSE4yP8AE8ZLF2mcGhVr2FuaKGB4k8WbCteoRH4lLf16mKc+mYUWJzoxrSOggR
 fKN0PGZUQkCDJnnIMd84WzHiObiDqlljpyxhy7KPj6zgl3CGvolpCxS
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMiBTYWx0ZWRfX3FInSedEKKaR
 1mfCxTaXg+9Vrg1sC8kFhAZal+GKXt2sqnVZlraJPsQa45aH8wyZXTHCOnSsRoPlE7l5zA2lQVJ
 AF3+ZVmqbD5ZY9VAs0AaatY2GwiGGew=
X-Proofpoint-GUID: 90p9kMLNePmG1wwWgr9Stfu3xLqMMsu0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMiBTYWx0ZWRfX64L/uUxWCLyy
 RJ31UTc+qbhXsDjdKGgU03rQ5ZCaRp7ythMwCe8WJYvh6wgngqCL9VxWyBupDvESyBZJkEWExsE
 q42+WiDqqxP5QSrCIDxjsCh6gjZpyN5WQVpsSo40zfgcKF/0Bgc3qpoMCgzjXE5KRVCiwTQLktY
 wZLoy4XTqSM9CEsw5Nvtq0FKj+YelFF4lMGAUBcziDLFzf2xz2Fsn7CkTD0HVJrhJyEPLMerx80
 IwwaIcBuJZvLKpvO4aieT4pT9nbR+FJFiqG5Dacw9De0krosVUFo0zYD9ZQl45ECeEuSWjDZmtu
 huQ3FzCkN8Sn4XgOzJNzLXbBhllT8Ty+5cvFifUVzuUZDiBflNf463zbpmg7kcXMRLOuNYd4EiW
 ZM0AEtQHpPFLILgpW2CubdyNakaxiuBQqhlY+nCO4urBtP1J/agttc7G1q/MIMETcFXREvns/uK
 EnqNPcD63U26ZQMeY5w==
X-Proofpoint-ORIG-GUID: 90p9kMLNePmG1wwWgr9Stfu3xLqMMsu0
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adad19d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XSycHmPQ-ps1G5V6GkMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230012

The Gen2 AR50LT encoder capability table advertises only the RANDOM
intra refresh type, so V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE
exposes a single menu entry and userspace cannot select CYCLIC.

Advertise CYCLIC alongside RANDOM in the AR50LT encoder capabilities so
that userspace can choose between the two intra refresh types. RANDOM
remains the default, so existing behaviour is unchanged.

Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..794c36d222d3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -2600,8 +2600,9 @@ static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] = {
 	{
 		.cap_id = IR_TYPE,
 		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
-		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
-		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM),
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
+			BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
 		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 	},

---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261023-iris-ar50lt-ir-cyclic-ec24f4150077

Best regards,
--  
Gourav Kumar <gourav.kumar@oss.qualcomm.com>

