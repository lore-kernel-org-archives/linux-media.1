Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369134;
	b=s929xqmmg1qMfz32nrKCNcAoDz3yPmHFGstck6u4leBaKE4jClmAs9/ai8xAOK+6I654
	 76QCU8CAX489/LnM/A64NwqEtZRnXvnVRKecFbB4bDPLtVa/k2ClT+HiBR/68RQPEB4rx
	 TncXbsF7+rqIJynlT1sBsnn9kkYPQS5z/CwlHXcBW9ghqZB6DGzNQU8v/s/uFMllD3mQe
	 zEihx0wqj8pwox/WKuaojK48xrIvjRaRkmeJV75FBvhNsCVGDKXKCaMTDIOSjvJSCxbrw
	 q+oh3ufmgDVY7YcB1/iJJ25NY+b3YpDu1QWgBXu0wRvwPSi+cJ01yWkmkDqQPJNbl/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369134;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
	b=gn8CxyDfuJJ+ZIsOZAdZuGOsYkY/Qe5d+h6LkhOAWD/1Zd3LGd8Ui5y9D3iw5fM00Dov
	 duM0PSlBzpshuv4lsF7YTQzWIr7AlHVBxl8gKL43bQVnaYX1lQrjUwno9I16N2G8c0QEQ
	 j4zE656PWHFldn2vMdZQsJZpJyIidBOWLZCs6V5KKSLwW8itTrQ1CATO6Gtd55+dV52gO
	 zLlhsWFoln/Puyjt95XX4NXK8dDIZryA+gQNPtkfXitR6hjjDmVzEdSquRq59smBnRnVh
	 xe8yHjPkJOkG22iNkWP8eQ2HpZVtTJh2G5yiTPLTnTfca7dHMJY9YJ2mIY6sf32NC4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I/B4aZSU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxBmYtt+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D85606A31A
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 14:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D85606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I/B4aZSU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CxBmYtt+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnVlI3431724
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=; b=I/B4aZSUbex+VvzH
	UGsrZ/7W+JVAfwK8lQqdrmfv4UkM2BuKAZKFE9Sm/HVI9Hi+D9fmMoJtXnah+iIY
	Up3vBSjW7ogvrz+TMhbMZNVxup2cRbceEQxdkP2GRUCjfrD44Ewx07Q/9HC5YjV1
	0iQfqKLuNrj/ec4SQoiTraQWtUci4WUAyybJqwQDm9p7B+4tXXdKfG7tIJ8qt38k
	Ht5gd5X5tsTeuRaO+vcZpAYUOnecBG2VaFwK9QVyO4nfKIQY68/Os+vGiAOfbeGR
	cy4zyS4CAwiQtVoM9a9kMOWKHqoB1jMGpIdJ4ZOjf0NytbiJJn8XaO53ZochKWiZ
	dQ4zgg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkdu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 14:05:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so845074a91.0
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793369132; x=1793973932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
        b=CxBmYtt+9JA0tzgdpQiWRIKtMLBNeL3HAJkpgs3vC7+W6ggITG6S76iMjbui451+oA
         2cN303WLhFG3hkUfplHFrw8XtE0VFOAEPa0wIJRe7eC2DFt2n+jSbrTZntfyE5Ewg6mi
         tmnuOtqouxtHbuxIJnnn2NFhN4hGRS9v8DZIVPZQr4cGII0aJhfNQDci8Z/KeH8FDUk5
         UigkvEewJf/wyDf19FJVQKiIo+79gdUqePWlGxuc3uBu+1iGfUaB7B1l07eWbl7rShvh
         VyAoxTOvndI4aNvihI6vi62yMCcXTvdSffGGuTS+XG9FPVWGobi5XrvobpryFNN5W/WF
         D1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369132; x=1793973932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbV34oi9cJeVMXAr54dz5VJbd/j+Zn5ocM7OggS00LE=;
        b=y2OhYMY581vFHQgCjNXDTyPdacxkzVY2Ewokkh/De7/rGnqt/ea+8N93/k/Hjp1Udp
         vpG30d2ycIgTxkzkOx0m3yqbnShncF77dY1JAJKbM134EvKQnfmSp0I9okfdkbwwTO0J
         T7YlrHLLmsnOmh/LxC8eMFcweIdis9Vd0vUa8Zk1D/xEiZ9XOj7q4U3vyfwufCcsoQZ/
         DgXTPgXTYD/NKNktdmqOomrWdwMgzq+38zXfY7o+RQmC09QMWvotHBpFkBwq6LUdTmuI
         5gwWYzkLC6MmEr9nsLh9/Tk67FC9YXpmOvpvgkdrCpIKeIh51hkp4kkAsB+d2cfv1Vl3
         LEJg==
X-Forwarded-Encrypted: i=1; AKwUvBwgd85BuOOZixpYyn43OL7sWA23D4TmrN2oq31wtkYox3u8r/4+RRHAjTrCTru1qE76R92khlvKoQnBTw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKTPdz0sOpCCGSRug85ZpYUXA6oh4QRxUXaF11kmLJW+AbsYRYN
	o0i6N7ba6Daxa+Eqf+t0WyzmDXM4S+u3E3P9fVcfhsKOHXFGirLrDNl2T+Bd0r+Pnpa72O+wi1J
	Si4EfovDk/6qAeiFZFryLnqjraWcBmg2foO62VJ6ELnmzdIGiTkjrNXaKCxfpBIaQfw==
X-Gm-Gg: AYBFou1ayHuFq/2aUeZo9ficjJkrooMq6guRXexE5+ft2rETHCU03UpTOeWmE33f4Ia
	WBPVvavQU+72jCV/ACCy1uu0nuYpQ8Ukg/p8i87hp0RYh1zgf24mumpW7I4EvmFGkB1/Pppa5BT
	TTk8aER5YO/LybkHYLWaZ64icsaYDukSczbYpEIJqb0njWvFBxLqSYXy2oqEXC27k+Khp/0u5/t
	NX41GCvzQKubceFpk7XEjDVBa9Z84l1lqnl57AgA0bNzyHqZUSKM13mHQpAf37oY1Ep7GXNsNIy
	IQWbtla9mfYrJtCehFkOnokDdyeAu/H2lUWelwGY8WahCemD1sh0G+ElklxtCcLZMFmGlLLzQNV
	lgRZfndMEaWQRsFpipy7Ra1HRjk2vXKcnYrwHtGpX+vNKfQT91NgwFrafm/D+188JoPpa/Bz0DW
	VWnvQHHBg2Rh/ZuP1rqk1+TjpPadmcXXfSnQC3
X-Received: by 2002:a17:90a:dfc7:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ae6f00cccemr3780124a91.37.1793369131961;
        Fri, 30 Oct 2026 07:05:31 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc7:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ae6f00cccemr3780080a91.37.1793369131298;
        Fri, 30 Oct 2026 07:05:31 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096fbfa9sm739707a12.17.2026.10.30.07.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:05:28 -0700 (PDT)
Message-ID: <10c00e3b-bdbc-447b-b8e5-23642faaa4d2@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:05:18 +0800
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
Subject: Re: [PATCH v3 3/5] dt-bindings: media: Add CAMSS device for Hawi and
 Maili
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <20261030-hawi-maili-camss-v3-3-9742bca8cef2@oss.qualcomm.com>
 <CAFEp6-2vN5UEbSwDH91eUzP_w7DHd3WtuLnui-_k7az2oQnoHw@mail.gmail.com>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2vN5UEbSwDH91eUzP_w7DHd3WtuLnui-_k7az2oQnoHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oHZVC_xP6Kz9Bn6oMn_ukmv3h3DAj-45
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae4a42c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tb7J9fPpy6OZh8FWujQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfX+Xt+s9N90i4h
 2y5V5kJ8AjWO2XTBC3i1dMmaw91aOiPYqXGpdwaoa5J+bvrAZY6HCvNwAIPwFKkcmL/85nOt8Qa
 CrzaMxLAzFU+7yPToqj2EaDplcT+eAkiQZ1AUxnwUQE1CtZ7EkDWhD9z6cifkA6swUqo1bEutVQ
 DA8/ctBAytG8WLnCWVMJvbC4JHuACFH21t5FDdp39D5XT6/o8quZkTjs2cj2+XGyB+62JmNNzy4
 SFMTGeWS2Mmq3ly0P2LymhQvus7eI3wy/4r0mDTigcaf8kXa+NAg6+mT/rGYBNbmTfyuDok01aZ
 lqZKi5xxcnSsEzpQg8zil/Y309FjLJF2A+dTALOEb0IPlM7pP3qJ92ClF3ow2MUOYQGvepi4yyj
 up9AIjF1CyV2QKoURFTIV1aupyjVOP8gjWgUQhVuKXolD4sFSi1iah6wD8BGdR79LKXEnwL+eAc
 OLWomJt5AjgjppSaogQ==
X-Proofpoint-ORIG-GUID: oHZVC_xP6Kz9Bn6oMn_ukmv3h3DAj-45
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NiBTYWx0ZWRfX1lRlb3wjjhqM
 BE27F7Siap8RsM2rIY676P8gDyKZLSXq30MBEoVIxlELheSYuKP/Yufjn+AlnepGkjhZn2T1FXQ
 KlXH91DE5dwsPL7e4I/fI/8Bkdzoz5s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300056

On 10/30/2026 9:38 PM, Loic Poulain wrote:
> On Fri, Oct 30, 2026 at 1:43 PM Nihal Kumar Gupta
> <nihal.gupta@oss.qualcomm.com> wrote:
>>
>> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>
>> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Hawi platform.
>>
>> The Hawi platform provides:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> Co-developed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

[...]

>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
>> +    #include <dt-bindings/clock/qcom,hawi-camcc.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        isp@9253000 {
> 
> Address should match your first reg addr.
> 

Ack, thanks. Missed updating the binding accordingly. Will fix it in the 
next revision.

---
Best Regards,
Hangxiang
