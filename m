Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3BC3E63AA
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535548; cv=none; b=LBt4Xn2bzOky7cctgorNfa+LAfgmXHrgnyNVnf57jZHoUTTYEXQA4qLFGsSBz2urwdhuRWoLx/UQnfEiOZk6ZiavJDkLrbyxVlgAJ/PPrXU8+gk+34hLHDHBFK8dtSGk+RAiGeuYsfIl3u41QuJAXDnhAo1SrIE0p3gi2aByGLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535548; c=relaxed/simple;
	bh=BFt+HHVErsZcnh/Y/wIax4idNUB4yL3NbnaeoV7ZDOU=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:References:
	 In-Reply-To:Content-Type; b=THLa4TVdW3ylBI2edj+/1sK3aN609NNkG/MkaIOpfYP3Q9MU/PT1vJ9mXS0iDTQbOb/RGWR7eIS5w1rNgAAOpV76ck4D+r8qotRYW+jDagwb0xnFJZYA5+OE4EmbuReCrb2RdR+g7uFmgIB9v1XLQ807bIN/y2vyyAa8DkaiLXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bpcetjdy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3WpzEpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bpcetjdy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3WpzEpy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KNTA1252487
	for <linux-media@vger.kernel.org>; Fri, 9 Oct 2026 08:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=; b=BpcetjdysSKzyQ1Q
	N65NXKdsDRcU3J346n7NV392I1xmA+ZfUF/Bq5zKnyV6Y3UGWlOXAHO4oTcWexNm
	JjMzfrUU4WJzr3FXdYahPYsfLQIc6FCqXlL+ihLUQgffGqo14Q9XGQgfdjZaCslr
	fIs6KUZoTmSQTDDCOPpjLBmrfxX+a58fkgctvzChxLzAMmiLj7zVVo7hZo7alrrJ
	EzWsAxDM8mVeHsERCTIqXJE3NtQo/Q16H/HIBFGfIu7t4epHU532QApzht/njoY7
	RuIoy5MWZwRKVKwXnW3YTFZgLolF/Zh8XkJi8TlDtuQS8j5GfM16cM5MIQSD7lA6
	EGw3HA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj3x4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 08:45:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so4888138a12.1
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 01:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791535545; x=1792140345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=;
        b=O3WpzEpy0lm0T0QarO3Gan24tRlC+FAQIx5WgnJgNS3h2wRTTkHH8/5xior0M7aHjr
         4GACwdPT92x/JOdpTFtpizJsn4jep6oaK3FOg+FqS9Bf/s1YKHjTlYWDKc+c4e/XK/hF
         Mt3QpFuJlkpV7e+x+klOJrNE67brRwN77d01/dYrdlkT3fvR4yqBNr2A9SSc6yaetfcy
         UmrMyGHNkVolhCvXwPVjksQXEOyyJ9D1iCMhOKXrSAWd0Zu9OmnWACTYdMQnrl9vNHpL
         3e87KDRRa3vADD9uI3lAGruQ2Z1QB5DKtLiOybXsW6rz0gcWsMiTmpu89lMuyJ65C1oW
         ymvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791535545; x=1792140345;
        h=content-transfer-encoding:content-type:in-reply-to:references
         :subject:to:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvRGWpHB0XMx2h6qPEzRJjxPlxemxdFmjLqq0RenMUg=;
        b=MXu79nmnn5PDGwGy+9zkVYqnAzXqBpqqESu4A+mE/GBQjIsXFEDp+KuuEqqEdJ7G8z
         nPiX8K1VoDuHRMRVp+sUVnyyWcFVO0DFUE+wk+3SHme/HxcKbFkJav8nRvIyi9TuxOJH
         DZrNXxu22tFuQBmrpjHglMe7Jw1c6P/6BMGLTY4nIY8uoE19PMy+h4lHYQ29ei3B0qtV
         TLP9bGdVhIBzjs4e/JebMuPtqO7/sqxCfVIVlwkK7QPlJOSUQ1GltFHM8um5HR0rU6gz
         1hlK4ow7BdZC9nqeOejTufnl6AdLbsfl/6E7tMhxUda5/0O/pfU6QH7RebmqMNuGl73r
         TsOw==
X-Forwarded-Encrypted: i=1; AKwUvByKQykcUagOl+11IYD0rR9x1S9fOu+SATUQUv2W3EDly2cjxTT4Ob7MT+p+gP17ispllCF/fUE8Wxv+tA==@vger.kernel.org
X-Gm-Message-State: AFuF++nJbsyTHDqehXeCyIEe9aniFxO9Dw29HSrg7wktmhE3Aa/9wYlt
	u1i4YIPl1Uv7N0sfFAwaeRopG3PokjPyWOfv78cNY001hZTBPm+59sAn3qBKF2o9y5DqtRJNa+i
	c4SW1lNAZAm7I9mXbYAb+0ap761r6aAI45x3ItkKvN+aFsDlfQl82p0z8jkEUPfN1ig==
X-Gm-Gg: AYBFou1ElmJUw3l9yiY34MLzxyGUTaK+wEUk6ualdqDG7DeahKU4VtcNILZxA/IzMMK
	rmyHNmwTa8lHr6X9Dv9J2m9iimcd4tb9EfSjpvgjq8n1Sg7fDGCjeXG3cn3JfBFD0Ijh89gND62
	MZaHAU4rf0RwdazXk5eX1DvPSPxR7gIzUvprMeTAtOB4L2nYZg4Z6sIU2+Ap5QSnlWKycq2UIl4
	PMlufjY8DvB/9z6vTAEqwaPZ0B4588m3SVgF9x4lldPT391AdAizs4kDB43vC8cl9OyzMncqDi6
	3RfzhRpLbFlkg13QqflcQ3oghI+Sq5Uy+NRIrSfuh0MLocMOTWBidhWzWs2D1gx6NdWQPRvuxax
	5HMJaVgrI9bwpWBU4zHTHqkO9pX+ACZIcvhWo6T1uvbnLbOBgCMh5QHSEe7AGzXI=
X-Received: by 2002:a05:6a21:9190:b0:3dd:85a8:4c67 with SMTP id adf61e73a8af0-3e16be5fa00mr1023336637.46.1791535545415;
        Fri, 09 Oct 2026 01:45:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:9190:b0:3dd:85a8:4c67 with SMTP id adf61e73a8af0-3e16be5fa00mr1023320637.46.1791535545012;
        Fri, 09 Oct 2026 01:45:45 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9d492d7sm599567a12.4.2026.10.09.01.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 01:45:44 -0700 (PDT)
Message-ID: <78ef7040-0284-4199-8468-8d7cca7eb4c2@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:45:38 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hangxiang.ma@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v19 10/12] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-10-b2c583ef50e0@oss.qualcomm.com>
 <82d48200-f13d-4b14-8cc4-4b1b2dd2bb37@linaro.org>
In-Reply-To: <82d48200-f13d-4b14-8cc4-4b1b2dd2bb37@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX2HBA8TpqKYiH
 fL+E1CYa0852GUBABgBbcbMjWqiJNl0o1TrEojD+FDZFqmc7dK/V5XigoaaMxakrkcEMu4nBADD
 FaIi2U4AmrzdzuiQDV18i9s7kFnZBD6MQUriXBT3G4ss4jkVv7S+t0bbW41Qcra0qo0u4yCsgJP
 s9w3TE1NBmeFFjCqRUHJqmJRC1K5fFVpGJyLBtYJLrJgTiEWGjG+13IOv4YYIrRpbXIrB6PJKEu
 X2NhtKQEm8qTegonfgEol2CQrftfz+lolkP+/PbP/A9yz9of1GhznAp9V1BQgYoW1kXXoQnqGrZ
 Q/7CGPXXC+1MPa7scqlvYVNXXu/7YAzesriaGdj8DJKiubARdHbdtx20OdEmTUHI8nS5Yv5vATv
 QGHHZpPNGh+BXH930UAGnBPtNTwYz7rAwM49rNtOQ9Im1PnoX7Y4v6tSIr3s/EA1FU+Kwfh4lIw
 NJnhWiC5e2+gyEEZsJw==
X-Proofpoint-GUID: 7hgfoutyh_ofKMikn89HRVVg7QfdLpqy
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac8a9ba cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=N5TnpenYHa_lGfR9nhQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7hgfoutyh_ofKMikn89HRVVg7QfdLpqy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzNCBTYWx0ZWRfX6W5mWFVBW1I+
 p2vWDH0UXVCDvhvGCKc9uOdUcMJZBOzpZYbnWJQH1bYqPIT+MWvCYBcjz8oB3YQMm0TMASvimyl
 aZNLyyRgS97zhb4sqVpkpZ5MN7tXWiA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090034

On 10/9/26 4:40 PM, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> On 08/10/2026 08:14, Hangxiang Ma wrote:
> > +        csiphy0: phy@9523000 {
> > +            compatible = "qcom,kaanapali-csi2-phy";
> > +            reg = <0x0 0x09523000 0x0 0x2000>;
> > +
> > +            clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> > +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> > +                 <&camcc CAM_CC_CORE_AHB_CLK>;
> > +            clock-names = "core",
> > +                      "timer",
> > +                      "ahb";
> > +
> > +            interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> > +
> > +            operating-points-v2 = <&csiphy_mxc_opp_table>;
> > +
> > +            power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> > +                    <&rpmhpd RPMHPD_MMCX>,
> > +                    <&rpmhpd RPMHPD_MXC>;
> > +            power-domain-names = "top",
> > +                         "mmcx",
> > +                         "mx";
> > +
> > +            status = "disabled";
> > +        };
> 
> These PHYs should have their ports defined.
> 
> ---
> bod
> 

Ack. Will follow the Hawi/Maili tempalte in next revision.
<https://lore.kernel.org/all/20260923-hawi-maili-camss-v1-7-cbbb42e534ef@oss.qualcomm.com/>

---
Best Regards,
Hangxiang
