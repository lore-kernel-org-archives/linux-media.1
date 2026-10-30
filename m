Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353657;
	b=JEBoY9MIwNSUZbgUxuYK8e/KBlCULPIlArG5qgzGIgwxcqz0HELWzB8pGl+5W5NQ9MLf
	 dH85jB5fLVM/n9nXPmmbrt1Wd4J+1qFzT9yDdohXt2sqUWifgS2FzPq+QP9pIfYKH/Sp0
	 qYPpBNztIUUn0DXXZ8XsRnsi3KKXVQ8nUq0eMxExyvBGrwSw4YtWBSHif/A86rpRpnqFY
	 kZn34cThO9ABR+E0wRnHlM/sG4qpgYQgveOi5cR8bxuJ1EuSJXQsOn1CcbSuYtaMYXliR
	 tsYUDV014Vzc+UDlrCq3BdQxFRbDZ7k2ky60hjotywQw77YZwHDcXt6yNoxUMzs7Asw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yAuzy/PmCFCD96ZvLiIzUHqzkYoqgYKNYRzD5tr14vw=;
	b=LUwE6rkc6uKyEZRtLBuiDLpiDUG+ohe0RvVIaUD0+wgiTcPl89FN+xNx7NNbnpCdjyZO
	 kUVLMlNwxnSO5Hf+TJrB925vvKHvwNnhTXCa6RZOMzdHzKwG7v2frKWrYFscgKrKoH5JL
	 szAfcuPMq23ryEZ6QJfSdS8BbBP9i1ZwEfGDaSoBuNBx39sZOLQ29sZQAzEWMnyEHGf+E
	 K+F38cPfGJqBEgE11H2C2TyRynfQSWsu46JZfp7yLz6RxKjYqt4jSSDv6rUJ/st4LNaGp
	 KAp+TjM4xhPag1Iq8B51xqL4K6cOhVqZf5ohqtMHgXUFsI5VeXkbLZ5GiWwKrm1UP+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F33gHJe7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEt1MuEh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07E606A321
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A07E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F33gHJe7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEt1MuEh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F06i2721648
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yAuzy/PmCFCD96ZvLiIzUH
	qzkYoqgYKNYRzD5tr14vw=; b=F33gHJe7W6G8acXNd7x6T0F3xPC62qRzTmHY50
	nP8dnv15vNczyHdGjPHaPhhQzO4weA0HvuAbJyks6USNDJjRpU0hKzB8jX3gCx63
	UnC1OFxLfLXJS57O98aXgRNZPdreuEM3vWY/qB0mhtoMzWWda3OFc+5YBz75a8sS
	MlkkTVAKp+fpbUEbMYzy+WXE/8SeQaP/G/EOKCukmYoDsQjUw/flCY0mxRisnI4a
	+j38uyGBZT+Dc8rM/bmphjYA95N/achpt0LfdfUzrT9JTAYRcj1ctJn95XuZf5XV
	TBL8SgjJGsy4lvVUSXtOowXQsSnnxrL5oG7FtrczdQOhGhRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj9v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:47:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944101e6367so101337685a.1
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353655; x=1793958455; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yAuzy/PmCFCD96ZvLiIzUHqzkYoqgYKNYRzD5tr14vw=;
        b=WEt1MuEh6Zlykbu3vcNIDwfU9JTFVZJDwsisw8P+aoBmVtGLIyAlEFNLrLM3M/BwRM
         p/HQTc6wF8I0riSCJ4149rYUmBosE5bB0uHJoFE2n8oWwsNWa706kxhNLzpjuqAcCgmQ
         /XslZfWnFmDXv8fLDGM4XO6kNpIwutS5dH57khzRminD6J/ilRdKoi1cRxnEbBRbmisy
         QPXX7vuc3x5Wxavw5ryW6dAvytjWVlD+rPUwgIXXHIxUMsqiGXBfO6SmDbr9bmDrJGaP
         dg7RbSUA7eGIP5oC2UB/4HajFh0aosdHdA6akqTQvNHhXnqTcp1RNR6EwGw4emXF3eX0
         OFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353655; x=1793958455;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yAuzy/PmCFCD96ZvLiIzUHqzkYoqgYKNYRzD5tr14vw=;
        b=UkLly+PUO1sDSF4oFbwHWAAO/+vQBhcG4DIYTilwJj35KptxA11I3T8dxgr57miqBw
         x0Eb/v0FcTQickVDACKsCZ7ITvR9j100W3ZaPSR/HdPRJeNAHkSdbAceRtVssLG5qpXp
         kPNgB8YGxDJQlHO5zydcIM+JizzS7G/2/0Wxd7B5oOUXPtaeUrUuOYN2yiSPhoLrDLi1
         IIR3e0mowysB/WT9acQp8NaDA3wlX+MWZ8iJAGsIalnoC//B0rSc0pUctXTPP41/uQca
         jk0gBdDThpwW59028PmBy/+kCJA/762lAjo0GOAOzneaNg/veBKHJSaQY7+NrRUGf1wU
         EDsQ==
X-Gm-Message-State: AFq9FYL1tN+07uZbCgft1QMdh55U7nWHNdlu9SGDxKdtfTKx3sCOCymU
	2pcRD/hRfFZnAtgwKR4H/KCbD+HzynFzBt551W673KWuSTz8Vc3U1MErLxiM1Tpvpn+SgZP8h6o
	ECeutxM2egmPIbVz5jhCKsBUlq1SVwZch4EH1e9ck7NWuurIIr3uEebBpvkSahTsocg==
X-Gm-Gg: AYBFou0M60LeML9EH2NGi4YPsb40EXV6ILWI5FxIQMLlwtpCP2rO+OHF1RdZ2LCuR12
	FufYbkALVS7hnL7ifJYY3vql3UmfzuSzbYz4Jjgqhux2cNWN0RXQzrBqg4ItfdhMP9IJSsodlpt
	Jkp+HEDhQq2C4t5i0+RE05TSdwHUW1kV2EW/nIYO/MCy+AIInWbfvrpReSdIw4z2M7tlvU1660S
	QwkFJKpARs8QE6UO6KwSVRekoLfnlQBCQyEEnpHlC3qp3uvfEjEaHdZAMZddOsaBfNI1+UIWPja
	rX6sJibWKNA/7Ys0M0O2Zg5b2EJXWcK6qnsaVR5PZDSESG0EOLFvqZZ36wF7/YJTwkCivuI3rXm
	oq3MCIYxaWLjOLxmMY8YL/bSeht+SgRBuScqS3EShPp3RD+BUUEk/XI/gXHmnLr6YaLptf+Z8Cl
	kI2680X7+T/f8GiYbrAHLyEBoutH1AeApufvicvnwV12GkhzPL+Fndwt+Jk8vFOddQXNMZ87abc
	Djp1S9PfGWa7ab3AK+8Muwj6lVP
X-Received: by 2002:a05:620a:2628:b0:93a:1196:ce5 with SMTP id af79cd13be357-944133c93b4mr695058985a.33.1793353654704;
        Fri, 30 Oct 2026 02:47:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2628:b0:93a:1196:ce5 with SMTP id af79cd13be357-944133c93b4mr695056685a.33.1793353654246;
        Fri, 30 Oct 2026 02:47:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d77:8e43:b62f:d85d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abeb77c132sm35354695e9.1.2026.10.30.02.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:47:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:47:31 +0100
Subject: [PATCH v2] media: qcom: camss: vfe: Clear active buffer pointers
 after flushing
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
Message-Id: <20261030-camss-fix-v2-1-51fe96b348cf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALJn5GoC/22MQQrCMBBFr1JmbcokLQ1x5T1KFyGZ2oBpNKNFK
 bm7sWs3H97j83ZgyoEYzs0OmbbAIa0V1KkBt9j1SiL4yqBQDRI7FM5GZjGHt+iNVoPRNBskqP9
 7pqqP1jhVXgI/U/4c6U3+7L/KJoUU5JzU2PXKo78k5vbxsjeXYmzrwFRK+QJeRiTUqQAAAA==
X-Change-ID: 20261030-camss-fix-4972697ef90e
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: JrMky-G9L2SmO1OFvLHXoKa2vSI3XE0K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX0TBCRWXCvDrP
 mDrjhe7vet7zMzgYTV1duNMEcfe8bRXOtLKcIcLXf0rHFFvoJNiNE8ADLUN81CEiFfEDwuGSDk5
 CHXSA9gC/U9QR9pcKHEp2ZMGYl6429g=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae467b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3pNaL92NREA4lOQ_sX4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: JrMky-G9L2SmO1OFvLHXoKa2vSI3XE0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX6YolTwAwIXGm
 u5LN1QSYyd7Oku8iCpHhT4jlZZvC4eci8zveP6axUtymRS7q0JlG8UjD9i+alj+6+bcd9TICk3x
 +7fpErwczko2s2hmtSiw9irB/stMHoVVIP9wPsYE0DM0Cz06uARm5k6L6Uiun9XFnZTsPIL+3lY
 SeBOJZ7MsWUTjWn1QGJsre/i314W94GIRk2pqSxxs2gk3XB4V1CkeYvDe3dKjYXxiEv5+P8Pe7P
 msRiJ6lWPbYqbYIzLsIgv+J/S6Mk5LyCox35lZ0gVYZYGHq71OXh1XKTu3m1GWMy1ZNGHi/tWXd
 ocriThbsbRSXHcab9bl2rSSf7xRdELdlVlnX02v1wLePzYvPmS7rtlTDnlHTIYzwz2kLq63XR02
 eAAYccIQBLgETZtnTICVnUWP6Tfi8oZbV23ck2+WQTeWIYbkg5a2FiAxAsZiEi0YOQCYUAsbqVA
 93Qrb9+4YOwNQGGg9/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300038

vfe_flush_buffers() returns all active buffers to vb2 but it leaves
output->buf[0] and output->buf[1] pointing to the completed buffers
despite the lost of ownership.

This can lead to subsequent flush or completion paths operating on
stale state and potentially completing the same buffer more than once.

Clear the buffer pointers explicitly.

Note: vfe_enable_output_v2 is supposed to overwrite those pointers with
pending buffers when streaming is restarted, but nothing guarantees that
enough pending buffers will be available to overwrite all entries.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-e617a776-3d96-47cb-8d60-a769340c25a7
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
---
Changes in v2:
- Remove unrelated changes/diff from this patch
- Link to v1: https://lore.kernel.org/r/20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..8e297e2bcafcbf30b09fc2ad6e57f484a4e41898 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1187,11 +1187,15 @@ int vfe_flush_buffers(struct camss_video *vid,
 
 	vfe_buf_flush_pending(output, state);
 
-	if (output->buf[0])
+	if (output->buf[0]) {
 		vb2_buffer_done(&output->buf[0]->vb.vb2_buf, state);
+		output->buf[0] = NULL;
+	}
 
-	if (output->buf[1])
+	if (output->buf[1]) {
 		vb2_buffer_done(&output->buf[1]->vb.vb2_buf, state);
+		output->buf[1] = NULL;
+	}
 
 	if (output->last_buffer) {
 		vb2_buffer_done(&output->last_buffer->vb.vb2_buf, state);

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261030-camss-fix-4972697ef90e

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

