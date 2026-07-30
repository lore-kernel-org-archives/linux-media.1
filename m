Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE4F450403
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425178; cv=none; b=eElJxoAjaVjAi+thHCgXA6+xeb7NSZCu+ytyJmzNSJWB1Y6T2bvuVt1bRz84HUJUS9uQCb9EpLWL5dpk93TexN2c4zPR11IsNr3iN3q+LWDr1E9QnByZjTRuIMvxW8DhPMbEAchhs4OykokrY7PL0soUtdQ0xSGifHs6H82ZMSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425178; c=relaxed/simple;
	bh=y9vKpxUNeawNZbt1t30qUQytDOCxet1GP1jy63Sl7Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7MjC2UhNURn2y8jgmx/UuasaDz5pk+ziHkv/nfDXay3K2GWkWvvWUd3oTxc17Fm2xKF6dhqAFSwZk8YPmlOavcU4vjjQp9L9JsWO7/fqujYv4dlZ0VHFdoKRMViYsgnCL4aBc5TlhTlSF5xVwm5ATPINVC+akGXDba8aQmnyr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOHcfnrE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbEzWA/h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOHcfnrE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbEzWA/h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEh5n11384921
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E30+tLnsmp8qWROLdYbSsKgQahl8HVESb2BIpNGL10Y=; b=BOHcfnrEw4Ig73QE
	lrEg9nkS3M/m2b3AKsgUM6FYlyKg0YBlZ01aRHANOTrZELO3njUTt7ysxO2FrLbm
	sfXt7nsiQFtorRW/cIPYO3VVfhHEneLJV2XM/eqrLjKXiJm8qDiV14cpo46Om6aF
	N/J55sqM6BP2Wgg3F5V01TwMK/CjLe4PgD3t4tbF8yR6XPn7TjL/TzS0RbCvHVjz
	KgwNxxw9EoP8jxiK9c+l6VgLuggmsIlDNu9rELUWGIZxIT4pqIMc56u1kGZEV8MF
	fjmypLcOIk5MpV/P9t3r7eM67Ev0BJDyfC9v6OmD606sV5ijdC+a3I9eCG/csSVp
	UJmbiQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md07sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:26:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ec91dc265so211620285a.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785425175; x=1786029975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E30+tLnsmp8qWROLdYbSsKgQahl8HVESb2BIpNGL10Y=;
        b=ZbEzWA/hWpfgJyJ3cTOVfQjRHzcXdq4ybxiJL7ERARc2vmrUl+Eqqjs70MOMelr/wm
         +vd3QKif9vUxO3B6AZUmt98GjLTh6xBvTWjVOEd4PmRsgUzy9Ir060j2eQSCp1BQL8Hz
         xbzv+CiCOrBplJurJJq69LW/dEYFS7R17et3d3uxZlf5eUaxuSrBwWI8W5/2ofQXcW8P
         dHZFjeAFikZfGYn06wWIF+NMDtkqGGDx0UtTlSuEtoXsWtlivbRNFKx7plNIYCze7Yo2
         nuH+BDp3G9uUwagPIisQEVWwI9XHpTrFOruYHhpVaTiThVeMEjpEEC6FND2AozmOMvK0
         JO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425175; x=1786029975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E30+tLnsmp8qWROLdYbSsKgQahl8HVESb2BIpNGL10Y=;
        b=ls8IQxkjLiKvh9o/Li5J6druLynEawGl0xuctAO8k6YE6HtpmZcJYegV2iNXBF/fjF
         f5bp8OVDs4nO28i7995B1L5x5ytTpeKbYoJ2vnWaiinRtTbjbwEEkEmUaOZiJCAczEgz
         i3SoT6NPoVxMCRvVwwUpBXmkCpjqpZmDY1D5hDdNYZoCKM50qx2nRBSIouqSEq/0LBV3
         RKxlLRvO7p0KfY0csA4oTzqFRQhCwxeYYG78bl11PqOhD1O8E73iyImzQvAp++aMGxWk
         kWfciTHKLfuFVfnb43FZVlbrDNCZ0KeqDEl4hS68mC6vL2lUthVVWqPYnOiMkZ9sgTlj
         kwTg==
X-Gm-Message-State: AOJu0YwHelSxqEA2k5wDyRGB4dJFcDr0vMtRuS0tThfxS+66lweCH9YW
	bI1MLEVaPgVGrxWU06Oqst9hb2Kj63LZoVs2B6uJHt0bnTYKtSpXDkSC7pcpHBWUgv+GGbwBYzt
	44ejyVQSHmqDnyMjaDz+4VyE6VV1ofPB/pPXvR+cpbE/12YvN2Jt5oQoL2A8ZusTiHQ==
X-Gm-Gg: AR+sD128XWcPnJ0Y82jh1uwsb7JBbWzm/SEKcb26nEaKaxXkSntPJQ+Ag1Fc6gn4uQh
	ps1a3y2TBtOcRIcnoCab1lXW+GhNTXwW6icTnJSR0jjbevyr3PqBOpW6qbay6qs4D+kzPgGM+HP
	MllrIp0hkFxfD9DGyzwHZwc9lfi2sSnbiUF+2D1yEmWYNmMHuzDVB43WN/54otIH4PwQr84ENTf
	WKaq7ZreNmMLg6xIkviRvi1k5ErkTe2KEIY7BJ2wYRLHt995lI2W0C2SrImW5ClHKnafQai/iV3
	o3UMGodp2h/yDJuRQcFdmMVgJY9WAm2RJDayiWZjKJaqdmOzB7s/4w01IUjxpcsl4SjJ7Y8j9vg
	D6NUZNyqED7iQkNq0sJq2Bf2++jr/reEeonLieTzL+BC62gEDuVVS9zI5/kHEA6NATgHoEfuEkA
	SbvHVYea1HxSSlKw==
X-Received: by 2002:a05:622a:400e:b0:51c:555:7dea with SMTP id d75a77b69052e-52b38499ebfmr35613161cf.30.1785425174716;
        Thu, 30 Jul 2026 08:26:14 -0700 (PDT)
X-Received: by 2002:a05:622a:400e:b0:51c:555:7dea with SMTP id d75a77b69052e-52b38499ebfmr35612691cf.30.1785425174256;
        Thu, 30 Jul 2026 08:26:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ed57asm443160e87.69.2026.07.30.08.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:26:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:26:08 +0300
Subject: [PATCH 1/5] media: iris: fail firmware boot on invalid uc_region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-fixes-v1-1-413d6cfaa8ca@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1597;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y9vKpxUNeawNZbt1t30qUQytDOCxet1GP1jy63Sl7Y4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa20Sdztqfp+JMKLqyVU6qyKhUfJBtam80cEzO
 fAHpmrtiuiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamttEgAKCRCLPIo+Aiko
 1YkiCACVxPtbrcvSjnSKVfT1+/Abay5U5qZTmGyvR6esLn0X/SK66wM7euGko85CiO505ZV3t7m
 4NAjDk2OV93NZkXEtgk07OrKWWW8ZmmbPwTfRJ1UWynG+7tYrC8qukd0ILlffx68ncVgdEraCkO
 FXEmaB9icEn/tuZsXtInGMeSpEmB7ZxA5VMt3k/85KIAqvfLVLtdtScuKr4rDQFVg/Nd7gjz1xg
 dEDkeOtFOZmPrYZ91hFGCzhPP6qEqIZ2eOINwOrqYI+OJQAa0FHJRwSLx/Xv+Naksh/rfk9PGWU
 DWw61EdBzsfGvUMqDO2QaCxeCXPcjpIoNYbXFrgm7J976py8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b6d17 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=bM5zmIW2MuzvGEp2F_gA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5Gwmduj1R0-WKoCUW0YzwpNJi0dtjt0l
X-Proofpoint-GUID: 5Gwmduj1R0-WKoCUW0YzwpNJi0dtjt0l
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfXw7pXCjB+H4iJ
 jTv2CzAgH+OypyI4QyH7dbGaxXQz2VpQStHtSj7z2XS4Qwa7LH0YhMKapY5C8bUTLX+VWPc7bDu
 WDobXvGxiEd+FbTZzM7+xcvdYk+UOpg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNyBTYWx0ZWRfX1RcTCx0U/1rb
 W7GemZVf5Pz42ysswZrDNNZrBD4NWLUolYk3bwbhmKUqKv0jogknOenAPhepx+BKsNfMac/6vb3
 1WWwXmaXES5La1QCcC5SZUVdLVvSMEYrm3klcMTXOUGbX0ngVjFdCMqEW2FriVIkiz7XqjEE3s9
 x9Qpan9OvIiibHOayo253m7dFzDfE3NuHiEZpS3hQIZ1KUSh9sCJq+UYtqaz1EtOT3uRK9YC2fb
 phU1sbZN9YFxL4O09bl1eFtpHOLqWPp54b4Jw6RtwUloWKKzz8GAz9wLs56MFre6bL4t87SKiny
 u89yrCt0gCKLqlQud+x9l8pRqV3nqvUt3TJBei3XTrYalx/5rWzYTVZFvoVTPONHhYXigecxMUG
 3bhUgwG9/9NL/b+rLYsT2TqFcP7Lnpx8YTJ6g01QsgNm9oK3xyamYC5JxbzfWEdUZCbqb7k0Ehi
 Eir1iSRuSbKJd6MkZGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300117

iris_vpu_boot_firmware() polls CTRL_STATUS while the firmware boots. When
the hardware reports an invalid uc_region setting, the poll loop breaks
early with count still below max_tries. The following timeout check
(count >= max_tries) is therefore false, so the function skips the error
return and falls through to return 0, reporting a successful boot. The
caller then enables host interrupts and proceeds to use firmware that
never came up, which can lead to unhandled timeouts or hardware hangs.

Return an error directly from the uc_region error path instead of breaking
out of the loop and reporting success.

Fixes: abf5bac63f68 ("media: iris: implement the boot sequence of the firmware")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..ac1a1bd72ac3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -84,7 +84,7 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 		ctrl_status = readl(core->reg_base + CTRL_STATUS);
 		if ((ctrl_status & CTRL_ERROR_STATUS__M) == 0x4) {
 			dev_err(core->dev, "invalid setting for uc_region\n");
-			break;
+			return -EINVAL;
 		}
 
 		usleep_range(50, 100);

-- 
2.47.3

