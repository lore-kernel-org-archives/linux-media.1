Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB47441635
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512474; cv=none; b=ly4sT8pkottR3mGgczjT1Zf9pQnPaSftl2I2Peo9wLPsO2IAuGmCTVvlSDjKtj9FrKk2strPgmjGyJXepZi1yXxGUaay5FrtMYUEnXcvQ6G/1pTrWmwExM2/dwwz/C1SplwulxgleyDIKQzCfH3kKz+u+TmGXECXe1UusRsu2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512474; c=relaxed/simple;
	bh=w44NQ7CGfCjEIC77H9KkwhhTGq6i+jRPjW0DFv4GItQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inunKRnEDwFc3/Bl2LgOGbKpL8g0XwESOraywCDZTCdZWPeuxKWeZ+pqRREyq4aXjvDldB6x3zfe9rJZhXx2Jx9iFHzwER0Pa3Y0IMihspuKskxZx0bUAzfpSKkv2a5EcC3k1oCwJk/Y7uDwEpiuIcGGYswFftijefYQHyHeiR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Njx/jRnW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRIcKPmn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Njx/jRnW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRIcKPmn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOA0h070975
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 15:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R6LlL2aWIX7N9cP3QSxIY897bTTboUlJ4EFUK8JK0Pk=; b=Njx/jRnWrkqDys70
	M9noEftidN4lnaa7xOGlOSNDBe9WrXoRwnnWE7ec2vstTXqv1Z9nd1H2zGje47az
	QzGjSsVILfIHvaebLo7G8Cz1U5We4cZ/q78XiZwqoFqL+TxbXnmv9I2hW8bt4h+x
	Z75jfO31ChCAbFTebhkNn0EfmPDt30LvCc4DHNwGw3j6HOsNTStu6kecRdU8K+hu
	VwQV61TfyyOxSvTx9aVDjVX7RIJ4Zlcr0Ewh3W3+kjEG8Kl8PmoqvxZpcMAO0Pa+
	nS3UK44QX6kYxgCGIX/45tTBS+/SOaCx96PIaWGdOuI+KCMYWXeR8uVSRm9NmZWA
	QEp2/g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqh2xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 15:41:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c27616421so2348951cf.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785512471; x=1786117271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6LlL2aWIX7N9cP3QSxIY897bTTboUlJ4EFUK8JK0Pk=;
        b=cRIcKPmnOcMyjk7LH0xtQjIaKUa1MBJYbNX0VyLAbT4nEx7RmSmqiG6IakNY/u/NGC
         250MnJ2nC2xgZhod1PdkySkS0B6QrJHaPyFxOlmUjZeksk69W6FZ1ZsupZofhviviarY
         43OpQ5Jrm+Hliq3Yn6FbCMaIOVrczXwNllo6qt+0GbKHJ1o0JF9uCZDf9MoxzDd4k/cb
         mzb2mMr5h7J/H8gLXnZo+GlSPMcVE+B49O5hDGjbJSixcw7lmeCsgcSf2CPQ+dhqrR4D
         RKkQp990FsO4wlnaXfkdw1xcUnnRHp7wVqywWnxjaZU7TptUaIxtRdyydG/WMA7kD86C
         ttTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512471; x=1786117271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6LlL2aWIX7N9cP3QSxIY897bTTboUlJ4EFUK8JK0Pk=;
        b=WMpTX3E6vCm8A53o7y/R+4lQ/1Vkj2lpTGdxeqRa9IZ9tq5FMAMRuu0hFAzfXlE07z
         Od6K28aLx69hK2c9PJCzLzibWLp1erPFFcQgHvVpYYyVEW+q9V4noN33NgQi0rIXm1A7
         xs21Xj6/I8RgRoMkuxWba7gA+WFykKHl8e/mymZud4+Ok2NlWyPdizE5EcBMusn1yxeq
         nWY2WTuKk5vJT8w7evq86+k6GwMkIxao/p4DIG21C88FdMRA449vYYtcPriMFNPn1Tcd
         0OHnZoeBGIoUc9OEUGFpe+KvCwQQ2vVpOhPQzBHI3YSbdZREnwMiw/51OUhdtM21OZv1
         nqHw==
X-Forwarded-Encrypted: i=1; AHgh+RrG1YyvqkjH1wfTo94cmyhu4QPw68rRiePrcMG+zmV8jNFGNN49Fr4XP0lnn6HA+upV4XLkjAx1Eqytbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsrjlzztN0OqbNFFhJ3mn5W7I83A6zI52Xi4CijmV23F7/6BGz
	eJgm5LwyEek9N6UCyDdB1b2dhiX/znPdfwL+xBJZFuBgc2fa1A70LaKE3Sejq/SPfmV9+vXwDHW
	E/M1sb/8HpppawoDGKEQ0zbMLzUIvHGmw5c6SNXe1kgl6Q+CwrEdM2RCbD4XhA0St8Q==
X-Gm-Gg: AR+sD10J71C2gMizgHdNQZDurD950+cj5PzpIeWRvBp4cpmlMZuS5zE8eC/zc1cCJ1i
	BnTJyhxkMBeqgTNmdm3S8Jw/e6ZlLtEbMPTtV68AqZxKMxtUBmoijf26zz/9GRHfqt0i/uB24tG
	TIPy6mgzqWQnAoSw8lTnKI3y3FaWlcVYW8NI1Hr2JAfcy3Q87iDZTTEENLpKDhouqxPk/W/H+L4
	iKHBswJnhtu39MkY//OBK3B7uP0xYHcSQus5pZuNYsaaZfWIS1FSiBTCHJ+ogjjO0NUBroixPXE
	TkDBXyCLB2jldfO22C5zRvW2VzJ4S7mxkRcfONepsAi9VhAg+HaVEj1wzuHxus60LELFXWcAuQl
	jEt5sheYnDzk64Le/lEInBBSU
X-Received: by 2002:ac8:5a51:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-52b5684f9a8mr7597381cf.5.1785512471029;
        Fri, 31 Jul 2026 08:41:11 -0700 (PDT)
X-Received: by 2002:ac8:5a51:0:b0:51b:ff78:f229 with SMTP id d75a77b69052e-52b5684f9a8mr7596751cf.5.1785512470484;
        Fri, 31 Jul 2026 08:41:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44542ddsm218339866b.29.2026.07.31.08.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 08:41:09 -0700 (PDT)
Message-ID: <3ac4eb1b-348b-444a-bba0-e4c64d5b57bb@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 17:41:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Add
 actuator for main rear camera
To: david@ixit.cz, Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260730-dw9714v-v2-0-d5da19e6c60b@ixit.cz>
 <20260730-dw9714v-v2-2-d5da19e6c60b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-dw9714v-v2-2-d5da19e6c60b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExOSBTYWx0ZWRfX/7FOTlzRFY9i
 bCKO8DVFgzD+REhG6FwCItOuRuk9MKCE5Gl1lm2mp0zZZr0TWJbB1ZnHeIKRcjcC8IjajPIbK+z
 nY+6guTgkxkxXiuqpQHCTzc/y+zXlU+3zRrFJn4Zv0/UKarY2EM2TVhAW7U4Wsh7dn+lOuo31PW
 oc2mnVM+ouZEdB+Wf5GJcEnmEnTs0z5ubuspT+PDMpHvpTwgYjHQyQEMzBiF4bhg07gsYm+HPaO
 7NJjF78s2KxR861oXZbWwBhktya/CqOOWDuruJAZmvXICLsTMBbyLisch0sN9UTUcaA/sf+gQT9
 mw944aTLevN4NqgFGV6w9N8oi0UMnhL882zZ3PQWk8uzgIaPxsGVxgHCCR4I4ZVyGhvgGqH5/Yn
 rqyJTa0k4Ib0992a0osEbOFqz63LD8R0oelx4Z2mPDihCv3qFx1y11XyEm9cPKDo2C3+4SBfsx3
 5lBnJqzvqLC9AEF92kw==
X-Proofpoint-ORIG-GUID: ATzoAK6TaeBAzxtF5y6PfMJCKAuF4HWI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExOSBTYWx0ZWRfX2hixB+zZZmAN
 ip4auV6vgMCer3f8o/OS0anZOau5eKLGNAljztIT4GVfG6l72fiDkN2mAvBSVnqIN+TZiyTnit9
 zcCyShTXXspviE6WTP7hYgTUNNhzGoE=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6cc217 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=olqSXg431-K1-hY-Iw0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ATzoAK6TaeBAzxtF5y6PfMJCKAuF4HWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310119

On 7/30/26 12:20 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Main rear camera uses Dongwoon DW9714V actuator. Add regulator and
> actuator node.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	/* SGM2036-2.8YUDH4G/TR */
> +	cam_bus_2p8: regulator-cam-bus-2p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "cam_bus_2p8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		regulator-enable-ramp-delay = <100>;
> +
> +		gpio = <&tlmm 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam_bus_avdd_default_state>;
> +		pinctrl-1 = <&cam_bus_avdd_sleep_state>;
> +		pinctrl-names = "default", "sleep";
> +
> +		vin-supply = <&vreg_bob>;
> +
> +		/*
> +		 * TODO: This node represent bus supply to the cam i2c module.
> +		 * Others DT do in similar fashion, but should be addressed
> +		 * by the bus-supply in the future
> +		 */

I can't quite parse the second sentence..

[...]

> +&cci_i2c0 {
> +	rear_camera_actuator: actuator@c {
> +		compatible = "dongwoon,dw9714v", "dongwoon,dw9714a", "dongwoon,dw9714";

1 a line would be neater

[...]

> +	cam_bus_avdd_default_state: cam-bus-avdd-default-state {
> +		pins = "gpio8";
> +		function = "gpio";
> +		bias-disable;
> +		drive-strength = <2>;

Other nodes have drive-strength first, then bias

> +	};
> +
> +	cam_bus_avdd_sleep_state: cam-bus-avdd-sleep-state {
> +		pins = "gpio8";
> +		function = "gpio";
> +		bias-disable;
> +		drive-strength = <2>;
> +		output-low;

Drop output-low, the regulator driver will set that

Konrad
