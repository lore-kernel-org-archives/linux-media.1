Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095262;
	b=JJXQ7MSJta80zEaDZbShyNjAiWIdGcFduzvCRbduGlaetLG/VF+3FcxCwsbPEpoWxXbk
	 AekHnVGBzlMbi9kiaCcuX1/MXIcjby4OzsMlvCtlat8cHWPxgR2xs6flmZzQS4UqvQ78a
	 2aP5MZ9lyQnMYEzbpoDfyyYbSRJgmYUFJQYBo0ZfTjymDQisLechfWe1d97dDCgxKxfdv
	 f+JvxmlaR8kAf37hZHaltKG7Dbru+ub78lR9UnW31ludz1l7w/asgIk88ZudH+TbyDe5m
	 IGNS0vuYkZERV3cVzuqc1cocjv1YnmkWs944tQbrwmahkZE/Hgwbj+/upt0oRjUoYtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
	b=HY0I07XW8C0GwNSRnED+LJQE52dIPSF7xi3GROC13g6dZ9Q//EpfZncK04iGX2KA7GLz
	 nEwX0h+6ByNHRqWKL7IxpiOwwmJ9GIs5uoeCUE9+xNmz4WK493D4BDvcI+ou0s5LICJ4l
	 r1dcnK4lz6wOE1bpGEahbnGCkyn8o+gbC16HKRDEALuoECvv4W3ltPZJVeE5xNSnj3D4T
	 v2GJsS0KbLKOJ3SjzfVy/x1ZjHG6B8H2zJ+lAhGpzG4zkUDietfCxIo0xwg5gLGbsaBwW
	 jaEKjyGHgxykCJkQuJ7WoSfrWuI3/ROLXoq28j9N3HSs12Vsk3Zp0UsnOl2LsLRwWWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=im7pBgOR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1FXb2f2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F629606A332
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 13:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F629606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=im7pBgOR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1FXb2f2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkeAV2684743
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 13:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=; b=im7pBgORjzoPB17n
	j5y184hEUdw1JoyjvY1hXb7jvS62rbF3Og4cl0O9fz/EjjiYrH2GVj0NtesGegRZ
	bQVx+NbIU+oeb3PhNagba2foACMHlZM9YgNB/SL0Y9xvOPqPBFZnQOzQ0Zbza1uv
	o5ADCGCM/GXFU6QWcJlVHLE1plAjZUS0TCqjCv7YGv9wS93fjRY6z4AenarCi+Zz
	GzERrUKeZAPDfT5p9Qf4CQ3PD0N2CzIPVJkyAiuZSk6ogTUHhpB9nWTJTO5GFWaE
	nH9Ktt1SdhcBC2C+xuKe3Xstv894tt6cTsGU7fpUOwHpX9qVF/b0vjM4W0VnNlU6
	Yxu9Cw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j20gu8chs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 13:34:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso1485260a91.0
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 05:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795095259; x=1795700059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
        b=Y1FXb2f2A6ldofU4SC5eGHthfBy736SjED/xRPvsiBHRZbdRFUEb+ahrOF0yENnnPK
         LjCLQbw8lyg0lpQMtZTYKu119J87hD4t8I1L3kNjGB65Nb4GQYCHyS49aamNWhtmvSyt
         zPzCMzPuou+IbJ3MP3isbfOhS3+ehTssiol7hlTcidOUmaBNsFAFcIrOK5ivDouqMDvY
         a4kFTMiqz71VWUQyTk/7L3Hfkc7RbwZby63ZkoZxL2VLdC4cRws0dg9UoefPgHN96CEf
         35GCozYul3qU0YVqQCeUgvRVp7B+n1KGPmH/ciips33NReQ3MGYVI0GAoLFC8QFLFZZp
         K8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095259; x=1795700059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
        b=uElhC0Q28dxJRunEsKGStbetxJZsNSAfH5Bx7Zxh4O2H9CjOYlmndmnoaIhRPQTmMd
         2MsWQnYvM7CpcZALdxjycGMFAtIIozeWUSqYiSVOxz2yulrfp0N4DqinSEYktpQekBAs
         Z9qxJhm5nDPHLtmzTM2KynErBZX4WRFex1reClouNKT62/teoVUhAzWBb6iEZ6l6uMZe
         JGAl//cfKJ9t3pyv/2V6af6hskM0C+dHVoyc7k4bWBD+axSvjKxkEd7MxwXmpxYyK3dU
         p7BRI6PDaZDC6lbC4QV7fXy7p612da2ip6hKGDruzXreUmDZYvrdOpMlB3MLqXxssm+B
         tMSg==
X-Forwarded-Encrypted: i=1; AL+hErEAwa/qM9j3+SOoM7rsVkCIH7JS74O3dLgUq5TixbCD56T8g3j1ctSbUg+AK/G3kOUPEtHgyDQxXetRCA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zoGco+5g3rzFyFhydSBSJoNBE5t8yO8YWZ8RKmUL9bWgrD6NK
	FnhJffjDxZakUshF9DllBo39DOWRdAqCFZ8WRe+BVyYxVhRUcjoWqa9hqlJR4g1JB3QdF/LirL3
	haeuxoajCEiIq66krEqNwQuvmlWUZ8SA9Nbf9FpzDlnl9EZ7ZnfQrtqMVs9eNBjTZ7A==
X-Gm-Gg: AZFdTZe2PFzMFB7kUL/7IgpJXvLSctdnXamFCF//RbnA9pNHDWGjfTcMF5sa0Y+PrJ9
	9so5r6o/7n4FiLOtc8AalwgsJ8YvwHTKL1txp70wARmlcBt0+h8GLOihEmDH1rv7SMJIhTjsvqi
	V2uNBWZJcojOZjmgZC646foNKxFdT4E8Meg7fzJptLz49/PQR89A1Hxuz7JY4bf+cCoj3Tx5sKH
	j1bOYKpbyG63P9N/J4VKTrky3cZmlTG+y1jTirN1Wyg8tebsVqA8QZemPZnu9cpuXTu0quPUgB7
	SEMjrGtFnEhkumxBPlC0eWlNxLQMFX9CCk9fpyXtMDMttaS9+AcVhHAJp9YZDBAx1CbAIeFClqY
	NrQxggUTGTOqbjT6BxU0oxYZ2pQN4ex7gfgfhlwDZ3La7MiK8RzQWn/9KNc8mU6gz/HSQakw7Hq
	JbsA==
X-Received: by 2002:a17:90b:2d86:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b3d0828c40mr5184630a91.52.1795095258598;
        Thu, 19 Nov 2026 05:34:18 -0800 (PST)
X-Received: by 2002:a17:90b:2d86:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b3d0828c40mr5184602a91.52.1795095258052;
        Thu, 19 Nov 2026 05:34:18 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b401f75ee4sm1493331a91.0.2026.11.19.05.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 05:34:17 -0800 (PST)
Message-ID: <18effb9d-b83a-4842-a32c-0f2305cf0a14@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 19:04:11 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
 <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
 <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
 <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
 <88467521-f50d-4c87-8206-4a3249f65212@oss.qualcomm.com>
 <d741093d-345d-4cdf-a48d-2c5e55be2129@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <d741093d-345d-4cdf-a48d-2c5e55be2129@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MyBTYWx0ZWRfX2vTILgxstBjW
 yAVS4s1ErhPabwocmLJCfiIXLMaNgGkDvfWzqQ+WmqOm7u43E4TnOBuCviIqq7V+PBotMB8sU22
 ycAtUVsad0oi01jW4mfw9RYMCXb9wRc=
X-Proofpoint-ORIG-GUID: UWIJIznW0PaJmwKkcGodfh3oKJP1uAqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MyBTYWx0ZWRfX23vUIyYNxOBX
 bjRPJDJGPxeb/vWriDBdu2BZmK7G/Z3rxtF7hsWISUAId+RdwGLUM/Q9kcx9HOXKvAwBkJNgDDt
 Xk2zK8L/8f/1kdoGaQ4BvVYMyxIIG4UBLEX3qxqDooh+8FFkjsJvOLa5iQM/fAc2VU5u9ISHelA
 NNOH/ZiXWfDwUT+6CZDkR0lJv8Cz4+4HDuslse0md/LFZYYGMzQzm/YXaRnpE6A8CsINJwRMc5I
 MecgQOWknAC5OYEE1euSArUwmvxRWUFT7Ck5fXIO8TL262RFBEW6gVCutSXfLUMIMIhjUrx+LNY
 NnlzQFor+gniIawxowsOOlIr2QFW0Wx16jfOGPqwOcZp+O/qQ3dXQkldjvHoxHJbOTumkBeeFRq
 acQWhRtdyTow6r3ex8IQYEJa3/GbqCVmrEI8/OPpn4fktzJi8I2+isyhLYRsN+vR59gsNz1btpH
 8FbIwuSoM2Uld8RuSLg==
X-Proofpoint-GUID: UWIJIznW0PaJmwKkcGodfh3oKJP1uAqV
X-Authority-Analysis: v=2.4 cv=XutvqlF9 c=1 sm=1 tr=0 ts=6afefadc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KOBisHcl_ayXGa7m1pEA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190053



On 19-11-2026 17:36, Krzysztof Kozlowski wrote:
>> How would you prefer this ABI issue to be handled, or should I
>> send the next version incorporating Loic's comments?
> Commit msg should be clear that ABI is changed, whether that ABI was
> ever working or even correct/possible to work in the first place. You do
> not answer my question really, because if description was not correct
> but everything was working fine, then clearly IT WAS correct to some level.

Yes, you are right. The old ABI was functional with the driver data at that
time, even though it used the X1E80100 CSIPHY resource index instead of a
Glymur-specific port mapping.

Old mapping:
  port@0 -> X1E80100 csiphy_res[0] -> CSIPHY0
  port@1 -> X1E80100 csiphy_res[1] -> CSIPHY1
  port@2 -> X1E80100 csiphy_res[2] -> CSIPHY2, not present on Glymur
  port@3 -> X1E80100 csiphy_res[3] -> CSIPHY4

So port@3 was functional before.

Now, Glymur is using linear graph ports instead of reusing X1E80100:
  port@0 -> csiphy_res[0] -> CSIPHY0
  port@1 -> csiphy_res[1] -> CSIPHY1
  port@2 -> csiphy_res[2] -> CSIPHY4

I will make this ABI change clear in the commit message.
-- 
Regards,
Nihal Kumar Gupta

