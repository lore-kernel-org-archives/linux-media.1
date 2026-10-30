Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341983;
	b=PGuW7BmDPsvOFyWQkV2pRs2WfQRrEpWTlz6SOt7+CPJpepZtASjwCMlM1pH/Fe1BY+fS
	 HbgfMqGuWzf2N0TQtrLVfwQpReAc/ak9CfTLgcCYisWymM/UmGkejJp6j/JtvdeZ5Ev0/
	 HVbAeQSpUDjRuKwzm2UmnaZrKoBbgXiM7vZNuZK6yvQveWyW74imfbG8swn6F0cNiTDVe
	 Vgd7uUKN63meITgqres0Jxmi11XYJEx0GcS6Ks0Y3+hAgcGaLUcn/qV7HJMRYa7WtNAic
	 lJz8Kzzz5vWKh0cF4IAFaTx+qF7FuYyYypdw1B6kL4foUSeXrhfWtzjw/EowNvc3X0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341983;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
	b=PkYB51NgE0T0Uj65h24/kRvcZXwCcHqYPKIZTw/L6OaFSIh418TxKzknkcH9YOUZqgr+
	 AzLEUC3sCmYb2ytlH0aosmJB/fUT5fSlpEwbhvJcLrgrrFHfVr93FVT2/TzWSG3frU/dd
	 W27wI4KZw/1LsJVqM0F20m27L+gtJvHf+kpVE+ygFTqC8uC/J5TeHHL9OyVBaYj21X+wO
	 9eV6GoBbTmVwNSEkEagkYC8jgA5+uDMqN/ikaepC1zOtZ3n9ouRR0TJotVQl4l8DRnkzD
	 lEPW3DhC7NtFvNQqfy+5VyHkGFVH5n7/6RhDyjQogNZxA92Xuich24Nepi3fCAk2DJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1RSRK4F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtIWGQBJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ED1606A330
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 06:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2ED1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1RSRK4F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtIWGQBJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F1fI1367115
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 06:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=; b=X1RSRK4FwC44esVO
	cI1sZomGs9qQNMZKll3WgSNzBz76KhKiPOTNX8Cd92JSF5Owy7yQcCoCE9xFitMg
	lYK784RruJd41RvhruFL+CWPmJz9ETLflH20iyd5NqhJZRWtAvts6t8MgSKccvx+
	RdlN13cqPuUod8sz84xaCWSQyC+5z33l6uJmAzXy+U/fsjtQY484DPw1Ua3KJyGO
	MMqMsiZ3Eir+MFgJWZDH10yl42lFPdaFD61cXqXIUM04uxm/pyq31qr+oQLcuWq+
	REd+9RJ5DMAF37sM5AaaewgTz0CWaUttXXK5kpoqPJBodUnGlZXM31kd/N7tDAWF
	G9A5qQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p9hhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 06:33:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so1895813eec.1
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 23:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341982; x=1793946782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=NtIWGQBJkmgMPmyKUsYZ+tKVP7pOe+VJbMGM5y2lA55TaNTdjWwYr9Juk84mAM6qrm
         p62WVDfedp9NzEKjgje18+bvTH5yTqOXYK1UnH7iX68kzr/lz3Ap4CgifJWn+VYvseSS
         oPpqZEHWPkwnzLQCFj/dPF/zpbhPkG8jjMx82aELw7Qmlqq/ycdowjEDlho9tGsIRvnj
         Jcr3mCbqjdPu0Bkoo7lVIMy5z17mUzA7WPwgWIND8USca+PxhelEUzZuPNgxBuMOalIN
         Vz0Cg3jkRex7Xh/YMNxHpv5cikbRQDfoa4fE2IlPxnglhc3mC3KYq5T6IsFlGLD6Y59x
         ZJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341982; x=1793946782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=2x9xoUA575cHxivuSS9DHOolOG4w1P8pYUrjjmkiq+3h0BMfNenVI1qcAH0PjV3rD1
         /5Q0PJestA3QyhpVUDSy5sXEmdehhQXKaWwM1dJyg5UL0n4k12PmimX1Jo5WvMKUXnik
         Cd/yjWj8Nw+OHyOt9uwhmKH5Ywe735U1g+vS8TvvhuB+MdOP2NY+hDacD/sbzWFY5g3D
         ngj8Y4Wn37IJdT/G4YV9rVWm+FUx2+OF0mc9IKmggruCRFJY49Na16ZPCEqb35Is+u65
         Bn8CtHFDaEyV0Je+eYIMCK0ZGl+V0ZbdV+fVIyP5XqgnNfB5jHr3tBwzL9G1d8up29tP
         xtCw==
X-Gm-Message-State: AFq9FYLbeMvU30Ol/zO68IvfXDS9+EvzwAvq7iHLXKDdP7wQza4LjWKQ
	QVBDjnIXCHfV+V3dNOIOW2yYp0AQrpmVkkeXP9zcyazv3zFwBwYw6DFuA3dHFOXvpHqt2zNjxwu
	t5paCkcMfKmDUjVrnRgoaARSlWiWnmzegOulvbn2qeEL/uen7ZYQactYT/jLPSF49Zg==
X-Gm-Gg: AYBFou0/ibCrTniP+e1dM+lKy/H37fu5OQqiMeXxO3ajBThjNBbzn4iXHGh+Fy/rOLA
	+caFP/oWjB9sI5sT3rOt2ouloX+ykNuOWs0fdLjKfYm3ySUBSOm6UB43fF1cU1Qy3yOwbc4wP2q
	9iZgIQHIO8/vSqm+EwG5aSqP6APb8kU+EwFX3rYBPOxtakbW2JWs4D3BvvieZwJGuB7FagXRWCp
	8RXW0gO6K+Ji5pfapk1RRxBlV/qBTRfTTxjAIHiWTl/bIi3fODSmm2pBXXXYcZ4YmzaaS+CDtN+
	ZplJY0WfKXroBQbyYRmXmE7RV6cccK18Jlbkkp0oJDUGAX4E6AMJZpM/lwniB+S6XPTtt1B5Yvs
	fStGdUt2ZTPbz3E8ielAOmpR+tYgkyvKW5ibOzOj/OX3k6Q3tLhA+7T/X6I8nBfyvH1wBqgBdWi
	doI/CF
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr2427662eec.28.1793341981415;
        Thu, 29 Oct 2026 23:33:01 -0700 (PDT)
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr2427618eec.28.1793341980697;
        Thu, 29 Oct 2026 23:33:00 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm4903419eec.15.2026.10.29.23.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:33:00 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:02:38 +0530
Subject: [PATCH v3 1/2] media: uapi: v4l2-controls: Add control base for
 Qualcomm iris driver
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
Message-Id: <20261030-b4-add_sc7280_mbr-v3-1-8fadcc873953@oss.qualcomm.com>
References: <20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com>
In-Reply-To: <20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341973; l=1121;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=yr22iLCXb30gmSFU65q7mnwky8PcLxD0pxfBcfk6+ok=;
 b=3Cq5D7cJ90leSeixqEjiCRDW3dXpjf8O/0NYHoXUdDai8UnyvfQVDa+WqTCERAtY2C3v0qq9n
 wh29bYYuZgNBlCq082oEhKARfhuZsf5WDbX5tr93BT0dNQJt+GAjSph
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX7TNlwZQpumfi
 kFnq7O7UUjnTT1dkFHD1HQYtHhXittEJE6hR9BJJqnDdCmjBtaUIb9OmvFykx7os+puRIZJwh+u
 Eev5EMkf0LgdhRSFxQM83u6uiqnwnFzk8IDbdGeBosW9hLzEfxP4oO2yFsAPQs7zka2hcK3mLA/
 4MCB/b8rCT1rAjT8yi9tMHd8l0JIXxcwO8AORIMw1rF6Hxw3juDQYNlYpfrL4tfgBf/FBP2+rFp
 XUQB3a+2XnLneGVs+bCtq/ThEIKu+WEn9g1F/xQCDy8y455VXSBdH8QGiDXL+u5ZbpD7AfcEhfI
 Z4XkhBVz9ZpVwTCZ2k3Gg3lGc/Nj91GBRUTjoXplkbA/Gl0NdrISqJO+bGICiTrv868x5qyoNeH
 mG6dUwfYPd5a1wfERX+5LeCX04yQ2wCyeB0qtXtt91KeDPY6GGd4zCP/oZmkpV3WDhRSrd0+OjS
 4DdbaF4lOCmFXPZsVZw==
X-Proofpoint-GUID: kB4qUzXIrdPQXuUfahgZz-KNoaIBthOQ
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae43a1e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=inWu9NajWAUUfZ5We6AA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: kB4qUzXIrdPQXuUfahgZz-KNoaIBthOQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX1qBZXzOF9fro
 K7ugqcZxUFhiI4jMI+WKbnvCic8nG7Fnt6YeapZ5QrNhQ064Dnyj1AuHGkhZ4aDdGu9Fz5XxYvy
 Q6TeURaj4wVE8TakclFcRnB1P8bTWSs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

Add a control base for Qualcomm iris driver-specific controls and
reserve 64 controls for it.

This range will be used for encoder features exposed by the iris
firmware that have no equivalent in the generic V4L2 control set,
starting with the MBR (Maximum Bit Rate) rate-control mode.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..ed2e2ef42829 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -255,6 +255,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_IT6625_BASE		(V4L2_CID_USER_BASE + 0x1250)
 
+/*
+ * The base for the Qualcomm iris driver controls.
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_USER_QCOM_IRIS_BASE		(V4L2_CID_USER_BASE + 0x1260)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.34.1

