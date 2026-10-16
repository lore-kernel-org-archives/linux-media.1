Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3084472F63
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150551; cv=none; b=liypBnjXEMGrLl5IaYnGBaacxxEdE3MIljJEuDLnigE07fBMMsidT6DRpgUoibJ2E5zM9uhzvO4YJY01XpLz7td91Y7KDkYYKPm4z5z8JZJ6Bm38rE7q2qsjIxcMMOhiHfjZUpebPTDH/1aNiOFRNf94+GRWue7SFEMHFcF5Nd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150551; c=relaxed/simple;
	bh=7rGnLQyzkLwTnL9Ma5ihnIWswpQ+yiXAUh1TvP4pYi0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LULIUQ1oppEgn47sd5IEqECtLHMrlCWNv000e0VV7/7DEskAFJ5D0p+uDDeN0gBRAJ3C9yOyuJBadORRg85qV2xoVstiZNMHT63AOGzXMFn9Y7WLDbarIKJhf/cykApKUVjzHhWLR9JjJjOCiMCdZLPGproySYVxKrp1MLV8tk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UDIoMF+3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imrsm7jz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDIoMF+3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imrsm7jz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GBTw671276978
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSPOXhDQq0GCi+jd+Z0hFBpW+y/WgMIH+G9un9D0uIU=; b=UDIoMF+3AKQJpFsQ
	N/x3DzaGyPlgboZYc0tR4E5T44I0ha7A/G2h6BxyrbGb7ZSF+G3L7/veJRUAJ3QW
	BTAK7knRif21xfKRaGdP/AHY+akjW9ZTNRFnoYA4GACa08xjQcbHH/Uqtiecm6HY
	t5Zy6/IPjf7dI4rKIeAmv5Kd56vK5IZxVjTnlKKzcfgkKyQgDV7BdT5DOSI+K3bp
	0hu65RBdJFr/SvaCB26hWBU7qrL67qspevVgQbNVNwCkVWxRUuVZJcG2kvMbJbwu
	XuKJXeliFeRKTj9jH0rtnKXq4EjPk5JSNajkIXtkPK+1NYqSXanVQsGUm62hsTjr
	ugeWqw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v00j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 11:35:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd3b9e70fa4so5468818a12.3
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 04:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792150549; x=1792755349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KSPOXhDQq0GCi+jd+Z0hFBpW+y/WgMIH+G9un9D0uIU=;
        b=imrsm7jzWzShHw5O+gP+UKU/Xv4GUZ1iGGtp09ncaMBf2KHpmIUXeybfsiZc7ANNMM
         VxNxiVD6qt6kyfRJqHmOaJMqzTgFnouVOp2mrQwokFvSDlxlGmJsWZV9oKJWxTtJxqop
         bdGFt57dTKK0oiBj6eih8g292dYgYSGUlU5plAJOoP5lOgDojioDDl4EeUBPYk5JQ5Be
         G7lRmJXs7a2uj/KNEHUuyOe7m9y7V9/PyxwG8BQwMQxCiK1M32eoj9C1fps5bP78jdew
         sRTvazgGcjv6j2DITzu3di/PNQcTeq7r3xyoL39Lcvb3sKLHIhm3KCFRyB5Qyz5/QbDS
         XtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150549; x=1792755349;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KSPOXhDQq0GCi+jd+Z0hFBpW+y/WgMIH+G9un9D0uIU=;
        b=aZVxf7AFlcJToW60p1fgnQtggt72YcLPeiNMbnHQCUxge9zUWc2TrP+KJsY8bUpEVC
         uwJBGDRxYqllEagjCckIXU9ol0G4XI6LwyVEoT+8yybkY5JOs5rSlab99GxNyouRI85e
         ib7I+yvLS9UQB3cMhJgvQY2RQN9z/AGaupgMjHYaQqS2gzxujQ0e81PGC0tKWOpxy9oU
         Z7KLzcEADXKWu409IBV36VZkozNceVJe9nFYUyZboj7MaNwM7eFPD6b2Y3vz9Pzupxge
         Ke/4NwOGkduUabmFSJ7/LTesYPi8Rqzf8EqkVtyKlehl1kfAEFwizBdzbOIvE8aY+YcU
         vfFA==
X-Forwarded-Encrypted: i=1; AKwUvBwnXmleYXCx/2VA+6SPpK4AUg1vIuZQ6NwzL99tXiiFBp0AK9P0XTPkE55haqGdJANf41terqGf1RHTbg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK/vDDsaLEH6Ptbf4dQWPAkaYBv6NG/N3/s/P+8RCNjuQ2tssgL
	0zXyKnzGZNHGlUIZNGOSa4rE4hv4DYC8Lt6dZOOkYfpZOu90ZGPk0yoKlhdWgEUjetjjmEf62/p
	d9js00QQ4YBwNVyY5SMbFoRBbKg0yVQEYw/GFsIqtv/qExSbzyK+GbSbZuz/ATjLn/Q==
X-Gm-Gg: AYBFou3PDCkrFPyjOR9k51HNa1K8hBiNI8n8opxdStz2SbYiNm/9OaVmCI8lOCmbl7Q
	C+hx/0Nom45zvIxp2+3JYflZQRWghXrAJTkgyvFJDbRXFtpWihoddaG1y742ijH0b7OgI33Tc7b
	cLUUgE71L3cm2D78gBAOILOYG3K0y7YX/msizUdd4pJxcCKs/VEoIRvK8XvFRzz4PIwxNOt4hsx
	o/3R07a7ZDoEzdCOSiTIypere+TCehm137qZxp7ri0gSllDHMMzoRrLt9Gh/Bu2MIUZkcuUNakm
	DtTcu7Gztr1SRUOHfqe/X+ol1NgYU+iPZD2+CYdzeoMP5eHWoezdCw3NtflI51Q8wrBvF6Kl7Wz
	rxc2zX8R4WO9WCIV8WCB6maSskqM=
X-Received: by 2002:a05:6a21:6812:b0:3dd:a196:3094 with SMTP id adf61e73a8af0-3e16bf09c3amr16527957637.68.1792150548660;
        Fri, 16 Oct 2026 04:35:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:6812:b0:3dd:a196:3094 with SMTP id adf61e73a8af0-3e16bf09c3amr16527889637.68.1792150547498;
        Fri, 16 Oct 2026 04:35:47 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017c70sm970158b3a.48.2026.10.16.04.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:35:47 -0700 (PDT)
Message-ID: <010f8a27-e058-4c8b-8681-24df30c29853@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 17:05:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 4/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: geocausa@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
Content-Language: en-US
In-Reply-To: <20261016-x1e-cphy-rfc-v2-4-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5KRk2QcsfISssMW7hEFDPlj5f-7BxqRB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfX97t8kWkp+4Lz
 7Y/3owc2rVat+O7AZFFKlvAyBRFH5eXNBS5xysjCviHBNtiP9GtboTVfedPKVNX4gKzvGN+kfZ/
 8blPKxMD4MV+pLK7nbaSyLn/zF6hP3U=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad20c15 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=F08ZnmPqtNv272u8dioA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0NiBTYWx0ZWRfX9QfkLkCozylJ
 +R2gb2tD4XBogoi6kHLOmI92Dd8sIU3uWPpqnzzlTQ5m5E6fVSrilaJAjzRkk2tse2beZCkRGgx
 jk52Vv66lvlROivlfFL1xQOVw2UoOkdOzHB8o29DVmMJXyK/hv9FI2hdjKHbb56bOylye42O5Cv
 UmwOu6FSQqFaCSadElXmt95wClLwX6deXy6lzkT5r03lzgFPwHd5L6nbIonQkm3fLDPgUMeT3XA
 AXe+NgotzpRgUjPQNCpeCt5Ty0yKQbT88L8sLHdaivXOPD8o4NIJCwgtSSPUUO6pLRU8NuRemff
 pzwwJYoQ/PgoYuqpKVlHmOsGFfuiLC2Bu/uvrUnThzfyvlfN3gRPnFBEwVI06ZyWaKoh3ovU6Lc
 W+ESYgXILQhsSbCkKl8crECZU/zxU5Z7T7eY7MnXn8MYW23X3PBbJXU9m0jSzkHd6gtgE3RV+53
 45/u39UUCPtKPdqzq3w==
X-Proofpoint-ORIG-GUID: 5KRk2QcsfISssMW7hEFDPlj5f-7BxqRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160046



On 16-10-2026 16:27, George Neacsu via B4 Relay wrote:
> +	{.reg_addr = 0x0a54, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a40, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a60, .reg_data = 0xa8, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a84, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a90, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +
> +	/* csiphy_reset_exit_reg_2_1_2, 3PH */
> +	{.reg_addr = 0x1000, .reg_data = 0x0e, .delay_us = 3048,
> +	 .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
I checked the register settings and they look good to me.

Can we write the delay value in hex as well, to keep the table
formatting consistent.
-- 
Regards,
Nihal Kumar Gupta

