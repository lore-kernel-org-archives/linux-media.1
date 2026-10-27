Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074102;
	b=BlTY5A/9YTE3n6En4YyJvm5/A2qAWX9TctJEVUyWusxrRFVf6FZaL08tXC+spm9hELfl
	 9N0j/wn9YdxVoHYoJGWEcZ5glZH9d/wLkOiNkHNlbItyL6cBkrNUM2aKA55Q/5oU9JWBa
	 xCFwGKJuAwTD1UQs4Dw82C0AoiOEJfmFsdZYwZs8FIL/o08GijPC925idfDfNCClCHEOx
	 wEDMHIXz9jLjv8U3nHiO2xAuYEYkYlysOZOSoSx5ZMNtz/ETJzhKBXWCF8jZnKnvjZVEy
	 sESHYWly8uLGRJw5nLthj9sP0iHK7b/YbrewrbzudgMbZqT5OEKS688fE1e68GXphFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074102;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RmQEj47q7VxsFN0LFghrtpu9Pl7/orbdB4gw0OrEDYU=;
	b=Sd2WmQ0iWNyp+N/luK5AnwMLPMcyRk4nW0AK6UfTcjg05ZtMAvRr6E52DPk8z9tPZLr+
	 chZQc4Qd4ugj6FxIheBqSyfws2e+yCef4IzkPITQyg4130fPbH4Kuo0gr2urh0s9Vrc1N
	 ZctULGse0WHqp23mr9AqPuvQK/RMUQMuiHO1idlMR4kazLdpumbwiW3DqOmi1kUrACVkl
	 ZPpVkF5kn4u4Dp3CjnFGWxe7k0eje0AQ/Yy2lQf9objxVD7oZZDG/4kBki5OF/uunZUPT
	 wson0sBh4x94dPlNmp+5Xm886DjOx5VyNTLYObLcHMXx7gezCi7w+TAVHbh2Xx48RqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EI3o1ZeF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pq2bvAL5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EBA606A31B
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94EBA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EI3o1ZeF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pq2bvAL5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F1mf3986714
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RmQEj47q7VxsFN0LFghrtpu9Pl7/orbdB4gw0OrEDYU=; b=EI3o1ZeF5MDC+pYX
	VaemFAd4mZGQUeQXCmhGHfBbomSWN9sXVjW7HWZq289jFJ4NmrY1kmj50tTCmc1L
	pR403LTE3foQ5tD5UJgRs0MPIZryrCYtIWpayVukEt+rHJu2jgZIozdarvKxTXF+
	rjZoSOXb3CkoO6ARlnUc9PPBeYdyQHOGFcyPKhp1UWCWN2T2dEZdmmtiVrMqV7fa
	eri7SSoZUszj1OqZYB5Te+gHoz7aotwmIZfgp6O8zqWx5Bu+hvdsLIyJsCqJb5P2
	J+j2WNMvGPu3+dht4i8daLwDYPAZlT5OvfoKf6jnOGYm8uCuMFYPSernMlVZE5+c
	YRjgcA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smtny1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:08:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a064f294cbso2932208b3a.2
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 21:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793074099; x=1793678899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RmQEj47q7VxsFN0LFghrtpu9Pl7/orbdB4gw0OrEDYU=;
        b=Pq2bvAL5JYldd/NNdVvFumNOEZFBK/gBvp3zr4sUt0zkNAXyj/IITRxwhjeY6WrOOV
         O3SlB41PIKZt79pJTGd5MOiSMpHADxKtAsFaVbyq8tybSgiUf70jyHtC/4jl1wYWUZgn
         qxTT5hz6oEnE0ssgkmHWSEoKvT7HI0lSdXlCtRmkYiF0WfVh2kuQONZvog9NQwfuEYvu
         mUQxWArbi8w/f4aASwvwhN7Qk4hhNph538UbDfbhF8cXJgEolv8PYE48d61fYjWS+ttn
         9cdLH5kuoYbsAK6e8Aq4+aEtNYzPucS6icdfnjH9R3IbG+6sPvSFffTHauCuhEIRs46U
         uplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074099; x=1793678899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RmQEj47q7VxsFN0LFghrtpu9Pl7/orbdB4gw0OrEDYU=;
        b=R6iMxc4PnHO5IQRaYPVCHL++ylGscaJaBMHy2OTDG1Ji/aeuE3ky8271QWEn2IFSNV
         PRL42YlgVaEqrc0BI2fg2wlu6PHl5iCIX+S7vVLZGj5sEUweTa6LC2fBAih5KxA0e4Ch
         lugBfXwV2TRUkb/0p5TMZp6XnxstT0QJX7WvKsVZU7Ho3Q7pfeHdBX1vCaZ19SZVzybC
         TVwuxaY2NgaMVPejYJK9uL+aj+jIDMc1CjWe4fUVrDVhfoUQbAdlq1xQBpjpLIxyMyxR
         LKtQniXT4Gmyu8cT/uWkEcXe2s6wLUI2WmxsTVpMmUaeTpwbAHzHsl8JP8nbEY46zq1d
         IPnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+nQtxNSCxkJvfe7OIlzkG+w0OsPycCvTEbq9TwzUISwkvhwMdWEgynUtI8WqGaIpD/WQ+ujIBczxaCg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIHpARRXild6E1b4spforW7QcPdZcz4iYMRXK2o5nvfRgcu+uzX
	mgNO6/xKEWf95nXWcq28RgSyjEcMZZiqeJ61+FVy2tqvz7+vxQq9WaLZxQO9AY7Awrs09Txvm7j
	QURGO+rsdVZXObaa2tzIRikyHpfQTdzeXfX4joFpThget2ydLyq3j2O9zHtlv2mR3Cg==
X-Gm-Gg: AYBFou1yrDwkb7IqLFnWqJ63QZN03DcEw0p8lFdNLgDixLPx4W0uTH/6nJQs3FA15ib
	A7WziV1pFqHrwWuO1pv8+8ySQx5QA5t5sVJZ0zvd1RtMckzIPr4pSOGF4F2C8hQL44ZtbyFXl7/
	eAkm1RmOBAxpOyuWavnQp2xgLEPilp3r6bGYsTngqTkC/x4juOUY4plM/HyCH51t1USijBnwp3t
	U2vqxK+5m2IWMvdcdjebppOVbj+UmPWBDMHltUOnNZtx2df42BRMKUl6uH0tVpMyExZVwNwTaom
	GRKVoC4ssfpuwrVukOZEhN0eAhdkXZAQosaPTvF2aio30+BEcxvSxtrDbKJFMK68zCZrDSU01bw
	kMjKsIWEv5deQPzDfERSRP/AsbNbu04ssUs1a9AVMNCNvvqAR1oFjmdWqWNmq
X-Received: by 2002:a05:6300:4086:b0:3e1:482c:77ca with SMTP id adf61e73a8af0-3e7af80ec85mr7789130637.5.1793074099388;
        Mon, 26 Oct 2026 21:08:19 -0700 (PDT)
X-Received: by 2002:a05:6300:4086:b0:3e1:482c:77ca with SMTP id adf61e73a8af0-3e7af80ec85mr7789104637.5.1793074098942;
        Mon, 26 Oct 2026 21:08:18 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8cccb7802sm2054232a12.22.2026.10.26.21.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 21:08:18 -0700 (PDT)
Message-ID: <ccce8847-6236-4b2d-a07d-f2345004de56@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:07:56 +0800
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 12/14] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com>
 <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bkSH06Umeh6h08Q6njFSszukC1WTdzTg
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae023b4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VpRCVQi9ATEJuri8zQAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: bkSH06Umeh6h08Q6njFSszukC1WTdzTg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX6L7jTMEvVvQC
 5vL9PjfKnPZHyoUVuAbHgtzsS67vXDYdrgAPY63K4V4JX9djT1ojk6LTHQHWkZmveFprBAGLEMS
 k7E6xj4kNooWU49VQFDzNTE4cgXY2SI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNiBTYWx0ZWRfX3sz3EtcrAZBB
 2la6G4gPnxV1lCo5RzWG/x9nOjNc+dTdax5nMG9oXKPeSkDg9dm4MzBJYkcvLX6Q2Zpi8p/0K9k
 A4Mrbz6Mi95QjSWtC+1vAgmDGVG+NnR3o/dNZpyPK3B0KcJGULeudgvU4mm24+k09bVo782sZBM
 JgnnZ8JHNEPpJWCvoUVkEfQ0V6jj0UVrRWCRPGiNxZYZrAcEDD0P4dxRY9URYmp6PPsfyS0dB6b
 Yu5APe4q4mjqomfa9hZwifHEopTcrKJsVm6K01RwnsHwsdhcVy264IrQQLOYAH0QF0lwgc7Xy1l
 Ky54OoV+giklYuoTnDRMLblADNesrTO+YldmqcOpI8U5HvttYiMiD7hkcBcOJhpPsKV8ALutGAh
 e/VVu335zmdM9DfRozBKxSjUUKBT8pN/L1ulQZk81Q+474wpCIC5TDzGfSVzcRT4yawZ26ldana
 Q4QZCgnhSgOGFYAsKXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270016

On 10/26/2026 11:55 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17 AM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add the three Camera Control Interface (CCI) controllers present on the
>> Kaanapali SoC. Each controller provides two I2C hosts used for camera
>> sensor control, so define the controller nodes and their pinctrl states.
[...]>> @@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
>>                          #interrupt-cells = <2>;
>>                          wakeup-parent = <&pdc>;
>>
>> +                       cci0_i2c0_default: cci0-i2c0-default-state {
>> +                               scl-pins {
>> +                                       pins = "gpio110";
>> +                                       function = "cci_i2c_scl";
>> +                                       drive-strength = <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins = "gpio109";
>> +                                       function = "cci_i2c_sda";
>> +                                       drive-strength = <2>;
>> +                                       bias-disable;
>> +                               };
>> +                       };
>> +
>> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
>> +                               scl-pins {
>> +                                       pins = "gpio110";
>> +                                       function = "cci_i2c_scl";
>> +                                       drive-strength = <2>;
>> +                                       bias-disable;
>> +                               };
>> +
>> +                               sda-pins {
>> +                                       pins = "gpio109";
>> +                                       function = "cci_i2c_sda";
>> +                                       drive-strength = <2>;
>> +                                       bias-disable;
>> +                               };
> 
> Why do we have a sleep state if it's identical to the default/active state?
> Do you want gpio with pull instead?
> 

The sleep state is kept so that the CCI suspend path has an explicit
pinctrl state to select.

As discussed in the v19 thread, SDA and SCL have external pull-up
resistors on the board. Therefore, enabling the weak internal pulls is
unnecessary.

However, I agree that keeping an identical sleep state is redundant. I
will change the sleep state to GPIO function with bias disabled, while
the external pull-up resistors keep both lines high during suspend.

Link: 
https://lore.kernel.org/all/d30d2b5b-0034-47f0-8e93-9abde4dad118@oss.qualcomm.com/

---
Best regards,
Hangxiang
