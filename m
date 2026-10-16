Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DFD49429A
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 23:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194917; cv=none; b=tMZR/vLXnpXIcsOc38QoD57gUtOHsOGJWlV2rglWuVCYqj/xT7dT82rAhrFm1CM1AWSmC8Ml8hG+4HdELiBRBWpifWcvxf+Dru7SrtcCpsLFDVY1S4+NqoRwWzAnFvZaGBRfHXh6ebTK0HJfGIkoxph6LxEr8eUhDNvHICUqml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194917; c=relaxed/simple;
	bh=bM9+n/kD0gSlP/YIlU9Zq3VTnjdW7BpXbunLA84ef3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fMBRjhjmOTXQ8fIwxvRbVvYdsD1vGe6tgFIqBCziO4WZxoPuKiuloTRnWxLka2oUKy+PnFuW9irwR2iOhcvAyBi1a60kZpjw7aAMC58msjU6dJiJMqssree4WTsS3n8SpcFU34gEX7XkEbe/P8OiBiQoDpp+E1IMxt3Zje0S1GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7FkmJl5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VS37Fqvv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7FkmJl5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VS37Fqvv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFBQB2783922
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 23:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZOY/FRwkyGg
	4a3iE+3qYDSoWchH/xcBkPBpM+YaDOXQ=; b=e7FkmJl5PGKkkeVXy3BFWbkzlXc
	29Hd0SIUT3Yr5EpDDf/FUnFFJGLeGrwQ+tImKWyHAH3TY09RmbaSO5j1PAOSzprI
	/QZY8W+0EJb8YhurcRF9WVnfFa0D3e5uYgsuuqRTX3ErjH37MYyUnChKqrJhJ/DT
	lMBKvf6MJ6R28f0ReXH/R1phY754nptRPAVSRG/WFu6oQ9yBeyQmThtHMhRz6ecY
	FbrYZi2PIS5OfHG0JMNljKW2TzPl5nObNNY1cAAaTPUykES+xhDcE5I5CF9kRJtZ
	S3c54f1Dslux6NKA2fqKTGSSITC6Gp/ad14UMBPv6k7PR21xx5cewdNiATA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v2j4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 23:55:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso668903eec.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 16:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194911; x=1792799711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOY/FRwkyGg4a3iE+3qYDSoWchH/xcBkPBpM+YaDOXQ=;
        b=VS37Fqvvh3hX/KxFDRW+fwucU5tKhA848M8R6ZSppEheMVBoGaLDGU9L0bOdIfkiH/
         jB2pyI9YauhwK9603BiwcGjm/n1fVX4DfjjYDjuTbjX03fhJ3waJUv1xKwJ8b70qAkqM
         LAXI9ndh8+9Cm4Wks79Ci9a9KCLl2Q8N+VnNLWOwD1YdvwfhB7fksnhaZQ03MsWWbIGZ
         ILv3G1jcQHKlrFiuJNtsJEqpDka9beLNTgnVwLY3lzjT393WN297hqcXJos774PPkv1U
         gPXd1TtuY8MGF6isXYQ1u0eIJ8EFOWy5RHY+rS580qax0TNwKX3eoCJ8f7mtLC5QtyXq
         Durg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194911; x=1792799711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOY/FRwkyGg4a3iE+3qYDSoWchH/xcBkPBpM+YaDOXQ=;
        b=ZoHcVyFB767Iyj1MppnA40mMD1nJQvm1B6gha5b272ofrX4yRxBNv9wolsOjyPT5/K
         rE/GJxVdSEXXK49qLMlM5MTn6OqOa+2aSpxlbtNVxFQAJ0Y45qgppH3o2eXvsszOkGHv
         QOEEkTHjuZILX2hAv6sVVWdgG7MX71uOc6Cz+U26xJ1AIcYnGQlP2Zvd8b/oiPAZtsER
         4mPchiTmViX0z5o1pfe8Co8i2urJ1iUl0NtGTKXcXNZQ2z0k6155aQ5KibFW3enebuQf
         yX57lqty1qFu0EuJ92xmN/2WjBySkYfAjraZvDktoIXkDXqh+kP7F0snJYtDlv019u7u
         75lQ==
X-Forwarded-Encrypted: i=1; AKwUvBye5oA9/vIFZ786Qs34R0tgbdkkEqmzxO48OVuDvWiYYbMA0SslTC73HioNFAiFBsnSdSDx26telBAWZw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLoJLShtaONC1OwZi7Xuou+uVoznSyRYGYdxuQqmwO5Tvf7UZLN
	8F5wNoHjOga7MdEnA4hjcovSqAgiGEZfXWb7wubcG4gMmkDGj8Ruu7zbyFvrtUFz2xZ4qc8Ebu2
	jx3VpIWUfFhypSjsdH0uq9HyBwtepo8UVVp1I16uaUyrFRQqNJFf0FdF5joJhel3nWg==
X-Gm-Gg: AYBFou0Ic/gUuRP0PTlH/c/LMr+TOUsicsNVpVtiCrVxoVPWsOs12utPZuMhrqpNSdw
	Wazn7wD1VvSvciizax1cWClNKu36gpuExoxzyRu9WRVKooNQbzm0VUWWsegICBl70YYJIXOFE7r
	+apslT4SwAK5/bMFv9kDSrd7TkI7BZk//NmDmmlfT4h3Hh5Bx+x8bwGNCiDK6jOfAf8V+kCg4jn
	Eweoe/ydhDorxsX9UgwpzZ85epyeZzOgdju9kWpZ6I/atjkAbLpepcz2i5LOl/U7Hlf8MViq5fL
	7wIaLdPmiICpGJECjU42yucBpM+wE1aVN4lixZp8MBl626DJ4aQ803tb+njhtQlGoxt0DNAFMCq
	GkoGLeWnkHT6le/V/wrPkRppmZY+7qwIWdIwI2ax3xlM6/LUm+GlCBg==
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr1615134c88.19.1792194911103;
        Fri, 16 Oct 2026 16:55:11 -0700 (PDT)
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr1615102c88.19.1792194910530;
        Fri, 16 Oct 2026 16:55:10 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:09 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] phy: qcom-mipi-csi2: Add qcs8300 CSI2 PHY support
Date: Fri, 16 Oct 2026 16:55:00 -0700
Message-Id: <20261016235502.2274268-6-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NLbkgadWkbUbtcKZIviqmb6XVvFFj7CX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX6mCRLySR0LZl
 SwRMuWV9erCdf1Pv4UqDZO8ejNFMdEF17rbMP6BPPgJlhqC/7lPb+gX5u/6mWHd5bM5zSuIdjjH
 lqkyrJmLcxMPv7iZ6PfdFlk2u6kGkGo=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad2b962 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=sspf3fhusXUOSPWbX3IA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX4FA5zCEEH0v8
 x2ktPPoIXkBlWw2HmlmQJFdfddS+EnVN7VFQLTv9exoTVbHF+GvJjr0Rh7iaMgjuSTJ6wo3xgi0
 Neh/D1RxrEzy/FkYNbU/NMtcOKCJ2Q36ntUCA8UN9bAVBPOtubCxZcm0zeQTCmQzT4v2rzZSh+N
 LRgqi/HetTSU4r2/iv4PCbAcGsKU9DlIM3HSGdk9+IaFMV49n9D5Y751KbyiotmTnRyaST6E0tu
 kfcAxL7b489jsTyCpxojCD/QUZFYNgIK57Vm1AWZIVunNjzHfBOCmMvTC/i2zzgOU0psH7GAvA4
 6TQcjl/x8KSIKD9yaCPYMqikvC26zYT7ExoGtWcYfUcIZSs1BuBeH8WyMtRw47s3FD36NOTdY2s
 4G5LBST6nXZnaF7DUxH3hFahSR+pfJ9xfFu4Ub5BrvsVL101ysAfGVKAbkhpT5FzGymUURbak9j
 KlSOvBcqFeotviYxWZQ==
X-Proofpoint-ORIG-GUID: NLbkgadWkbUbtcKZIviqmb6XVvFFj7CX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160095

Bind the new "qcom,qcs8300-csi2-phy" compatible to the existing
sa8775p SoC configuration (mipi_csi2_dphy_sa8775p). QCS8300
and SA8775P share the same CSIPHY: in the legacy in-tree
CAMSS driver (camss-csiphy-3ph-1-0.c) the CAMSS_8300 and CAMSS_8775P
cases fall through to the same D-PHY lane_regs_sa8775p[] init sequence
and common_regs_offset (0x800), and camss.c gives both SoCs the same
pd_name = "top" Titan Top GDSC. No new register data or power-domain
wiring is therefore needed; only the compatible string is added.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 821c6a0a916c..cef4a90ca539 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -453,6 +453,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,qcs8300-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
 	{ .compatible	= "qcom,sa8775p-csi2-phy", .data = &mipi_csi2_dphy_sa8775p },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
-- 
2.34.1

