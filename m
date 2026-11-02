Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610854;
	b=gvjlMbmui0HXaTsZM7GyKxgrQKBpInTwlCwdfpB2GFVZJEHACnzPAMiyxNjO+CeSXG8i
	 bjRtJMjpr+hFHsDSRsHStvhPB0etGobGVaynljI5ksqDd4mzDuzp3xh89r13Berkd9+HG
	 wPwW/My8PRUSW6F6w1LQywFw+luQvVUxvIaRmm6ofFfu5n9+L5tOp/P1nD5IEA1exmkc0
	 yrQbryUaoHw48XUlZDzK0vQG5VLfj8MYppJBPfQCmgoOOVlR7BZ74XZUZy3IVtGdTGeLk
	 83/OZuSVtfQG67VtYqpdQ5Se+u7LkkqolMcJ/VqYLynSjI6xweyiPMCBE5tjHo1MkSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FkjTCbZbAOo8ECUEfeHoaX/lb8xKqfY81paL36Q60KE=;
	b=guveI6F4Iz9Ztop4kHp6Z9dv4ci7Fepuhg15OB5jL+nym4F+rnCDmUTAQITMqQYr1BkX
	 E8UCQLz22aliCM+vuugbpkEDKg0+naFr+UcAjArXcPXwMrrYUcm/X7ZdwNeZ/6y4UGPqV
	 n9JcedpwtGFpmMC537tsutonjNr+XfFQIBhfy+QI+TM/pYy3PtYmbFhZT7+J7lWCzqIws
	 rvWLJ8JyMgObpitZ0ozsPHGDhwemJfHvt1y74XlzdiDpk4tYnJ82sjvbiRQX6Z0vaDqBI
	 oHS5jQfj6ekqhIg5codSxgW1RDHwtTB8X+Yo13Vab+Gq6ludd7w+44bBDm7NJ9k8MPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGd4V5zt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+RV5ti7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8E5606A329
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 09:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD8E5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QGd4V5zt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+RV5ti7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ACZs4039397
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 09:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FkjTCbZbAOo8ECUEfeHoaX/lb8xKqfY81paL36Q60KE=; b=QGd4V5ztbHThHXks
	RgiMX9nYoLlIvuMh4gzZPAQDISoGFM3fn1DcfRJfpHJngYVkNJw4c1hg79IKEP5n
	sflUJ+66mWA4qa3fWhqrxFCHSIrFTPuC2R2HWHc/aswtKYTCE98hCIHZbNazUm8r
	r29ZdwZ94Cj3qG9hysUbr/qAXOOFBu0LRhYH/llXGro/FhbGaAyWUuZKE5HxVbJJ
	hsy5ztW1hYD9kt+BLs2cRs/FZrslux/4gvmY2zaEUcWAOx899CR1U9Kj9o37ZeVF
	9TreAwtWeLrwmAE3v2l1d7YWTWMTZSOQBG+0fB/CXDugAddD0mBHKF5KTOglk2E9
	bx/PRg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18b86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:14:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso3872286a91.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 01:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610852; x=1794215652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkjTCbZbAOo8ECUEfeHoaX/lb8xKqfY81paL36Q60KE=;
        b=H+RV5ti7tcMa/1Ua9HUMRc9nOOSEzfDWPs/D7KIBguVrFDouF2kzclSPXygbDufpFt
         cL83PQbJlmtYXM0J70xXiuExfdX3YRZ6uXvJJvXK3R9uCJvgp6ccRs3hOGyUMksfcFVP
         O6d77Xpi/aTiqVvGz4eJqAPbicgFNk/vd32x+ofQhu3fkuVmBoFsxwKf7h5OYG3Blsd6
         00WJI6yUSgTvQJjlzcqnv31oPi/w8PAPRZlTIwmqtRR2J1EwhFjvKzh6oe1XNQnnUpM/
         UFcQ1g6SkJza7PNmJcpX0WtGA8komu4j9nCMjszr71utQ/FyotbGpxGwkBANuUWLTB6i
         y1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610852; x=1794215652;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FkjTCbZbAOo8ECUEfeHoaX/lb8xKqfY81paL36Q60KE=;
        b=GbGfDED0snJDtfmDAw4ZcF+6mRkneG4PF7SPT4r5sgXOryRNekwzWvp1RZ18rSkx2a
         vdDwClmy6XZI+JhKTJV3ccjY+8WFBVNOD66zJc0UsQfF2qJX2EAePQhf13ohzHIIknIE
         0x2zTJ3RIh0PgMWdH9PDtZpSCXnBABLn+aP272b+WtDYWeBs5b0V2vaDDHiIKkuq6X1Z
         WGj/HUWC6cse0JsrJfTgRJ9vEa5Lwu/XgKixuw0owg5vpgGn0y2ezViPx8axcbsy+aCx
         rErNkUwuE0WaJknPREhBcXl6IG4sLs2Cok6Y7yaXh06XUwatkQMzl3f/bNiEStkg4T8d
         Peuw==
X-Forwarded-Encrypted: i=1; AKwUvBxqSp+WhqPISy92ucQbOmox4bTBHuf4xUSe7w+q5UfWP7z96DkI8Y2JsJUKb9aY8UOsvqhwC1Suz4svhw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/vI6ycic87fXvV++dkMpHjS3YGIS5nE5MYIoA6/DFWQ49vNRlI
	0dumUDwbIrvFWFawfSzeID5UrnlwLoHYkLiWBozBQtMOefLoZCujQ0FtbK9jV0ZW9wQQOjVmy5S
	+ijVBsDm9EzEOV+Ol+fc1c8tQEWZnXGwwlP3Del+LYZ2uMgcX0KIH2H8NzOkgvY99kQ==
X-Gm-Gg: AYBFou1lQObBcudTbFJCM7w9iPJJbtGniEGsvGbggC0Zslkr9ieL0zSFZ9W6wt+u660
	9j2IgIFftcoySdrAJnCeaAgLP4jASXha5mbaJtuzjfpOcjmIkxM+YRDPOuh+oWY6GjUSQiJYVsS
	SSKdASHr69G/XmCCfAk6x1PZSDQ+hMvhsXfXCxHtc31rQRC7QmVdN00/Hl47wJtjTJ8lR6ous5O
	cqMzFnEvvXkDsZ2hLds7dj/4vgd6gg1uQQevslpJHS8WjBoTe/jbR2y0//NFvnwJIWqBzIcacC/
	1mQAfN4CHvHyN1s2EGAjxv0NotF7dUlQFg6GPeXzHoC8b7Y7GiOpJNe8GjeDXyfXyMLk3aunmFH
	fFDCt1fvymqdglpp3borUIsslD31jsWPMtF5uEWsOgqr5G6EaKZoMk5oiGlJTcUn51hcdK/NXM+
	f+9yQ9vAmtJkXAPR1jM8jukaJzpY0bgUqJ
X-Received: by 2002:a17:90a:c2d0:b0:3ad:eb34:4c6c with SMTP id 98e67ed59e1d1-3ae897c886amr7951673a91.13.1793610851644;
        Mon, 02 Nov 2026 01:14:11 -0800 (PST)
X-Received: by 2002:a17:90a:c2d0:b0:3ad:eb34:4c6c with SMTP id 98e67ed59e1d1-3ae897c886amr7951656a91.13.1793610851159;
        Mon, 02 Nov 2026 01:14:11 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85e4ff4csm8529437a91.1.2026.11.02.01.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:14:10 -0800 (PST)
Message-ID: <23f27b4d-fe83-4b4a-b358-db89c54e6f2f@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:14:04 +0800
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
Subject: Re: [PATCH v23 05/15] media: dt-bindings: Add CAMSS device for
 Kaanapali
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-5-95f250b18612@oss.qualcomm.com>
 <af3600e1-fc1d-42f4-aed7-380d9546b910@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <af3600e1-fc1d-42f4-aed7-380d9546b910@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZgrQ7Pma9fgHRG3zzLXJ8ct-y34gqm8t
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae85464 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hZKHP_SayGcxdSv64igA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZgrQ7Pma9fgHRG3zzLXJ8ct-y34gqm8t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX95YHJHTL1MMC
 +fvfW3jskKyO/vnLsdef0hQXt3q6xYk5NRJsrxJkTIijWkf1707kOfLrxDlMZRUGL+fC96qHhax
 HhlnG5N58/R/fWNlwWM3UgKQnSa0Wxag010yRQz+MJepRZjEPJfj28Nlr79Vxp4ezyb0C7+GwtE
 LXt3wxuaMz3OOejsEdVkT3zHACaw2nrteRkOrgDTDFYUcy3CW1SM/36a1tOJdke4Ag8q7d6tAGX
 I6vmqTRhyJG3NM4lt0coHqQs7x6z11AJu/soF2BUnebzH5q5xK6+SPpWnKB8qQbWjM5mlJM50QJ
 8h7ro1xZ9r7hOGL7ShG/G737ln+9ZJUjRq546AShFakQyhDWUVlIkn4CVhSCMrQ0yxav9xFOaoH
 +MQs9NmD9mkUU7xseNdj/xQCPeqF5cgAWdRz3D7ychOjs1QfV3QMoZD17O+1FEVqk3zPQSIsWA7
 rJ7LHKBQWkGjb2cLG/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfXy91iq7QRRvF6
 G8LYUmhh/53tCgV+KqjUVm3E6mS5XeOxPjKdQMt29CvhIMYV9jGbjFHEfbsPLMEyWenxu557Ccc
 tvBmBBADe/jF3V/qSkQaFY0RsvmfIvA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On 10/31/2026 7:52 PM, Vladimir Zapolskiy wrote:
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
>> platform.
>>
>> The Kaanapali platform provides:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-camss.yaml       | 306 +++++++++++ 
>> ++++++++++
>>   1 file changed, 306 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali- 
>> camss.yaml
>> new file mode 100644
>> index 000000000000..dec451fc940f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> @@ -0,0 +1,306 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kaanapali-camss
>> +
>> +  reg:
>> +    maxItems: 14
>> +
>> +  reg-names:
>> +    items:
>> +      - const: top
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csitpg0
>> +      - const: csitpg1
>> +      - const: csitpg2
> 
> Rename it to 'tpgX'.
> 

ACK

>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +
>> +  clocks:
>> +    maxItems: 23
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_nrt_axi
>> +      - const: camnoc_rt_axi
>> +      - const: cpas_ahb
>> +      - const: cpas_fast_ahb
>> +      - const: cpas_vfe0
>> +      - const: cpas_vfe1
>> +      - const: cpas_vfe2
>> +      - const: cpas_vfe_lite
>> +      - const: csid
>> +      - const: csid_csiphy_rx
> 
> The common name is 'csiphy_rx', the clock supplies CSIPHYs and non-CSID 
> TPGs.

ACK

> 
>> +      - const: gcc_axi_hf
>> +      - const: gcc_axi_sf
> 
> Unused clock.

ACK

> 
>> +      - const: vfe0
>> +      - const: vfe0_fast_ahb
>> +      - const: vfe1
>> +      - const: vfe1_fast_ahb
>> +      - const: vfe2
>> +      - const: vfe2_fast_ahb
>> +      - const: vfe_lite
>> +      - const: vfe_lite_ahb
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +      - const: qdss_debug_xo
>> +
>> +  interrupts:
>> +    maxItems: 10
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_mnoc
>> +
>> +  iommus:
>> +    items:
>> +      - description: S1 HLOS IFE non-protected stream
>> +
>> +  power-domains:
>> +    items:
>> +      - description: IFE0 GDSC - Global Distributed Switch Controller 
>> for IFE0.
>> +      - description: IFE1 GDSC - Global Distributed Switch Controller 
>> for IFE1.
>> +      - description: IFE2 GDSC - Global Distributed Switch Controller 
>> for IFE2.
>> +      - description: Titan Top GDSC - Titan ISP Block, Global 
>> Distributed Switch Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: ife0
>> +      - const: ife1
>> +      - const: ife2
>> +      - const: top
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    description:
>> +      CSI input ports. Each port receives the CSI data
>> +      decoded by the matching CSIPHY.
>> +
>> +    patternProperties:
>> +      "^port@[0-5]$":
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data from CSIPHY 0-5.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              bus-type:
>> +                enum:
>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +            required:
>> +              - data-lanes
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - interconnects
>> +  - interconnect-names
>> +  - iommus
>> +  - power-domains
>> +  - power-domain-names
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
>> +    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        isp@900b000 {
>> +            compatible = "qcom,kaanapali-camss";
>> +
>> +            reg = <0x0 0x0900b000 0x0 0x1000>,
>> +                  <0x0 0x09253000 0x0 0x5e80>,
>> +                  <0x0 0x09263000 0x0 0x5e80>,
>> +                  <0x0 0x09273000 0x0 0x5e80>,
>> +                  <0x0 0x092d3000 0x0 0x3880>,
>> +                  <0x0 0x092e7000 0x0 0x3880>,
>> +                  <0x0 0x093fd000 0x0 0x400>,
>> +                  <0x0 0x093fe000 0x0 0x400>,
>> +                  <0x0 0x093ff000 0x0 0x400>,
>> +                  <0x0 0x09151000 0x0 0x20000>,
>> +                  <0x0 0x09171000 0x0 0x20000>,
>> +                  <0x0 0x09191000 0x0 0x20000>,
>> +                  <0x0 0x092dc000 0x0 0x1300>,
>> +                  <0x0 0x092f0000 0x0 0x1300>;
>> +
>> +            reg-names = "top",
>> +                        "csid0",
>> +                        "csid1",
>> +                        "csid2",
>> +                        "csid_lite0",
>> +                        "csid_lite1",
>> +                        "csitpg0",
>> +                        "csitpg1",
>> +                        "csitpg2",
>> +                        "vfe0",
>> +                        "vfe1",
>> +                        "vfe2",
>> +                        "vfe_lite0",
>> +                        "vfe_lite1";
>> +
>> +            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
>> +                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
>> +                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
>> +                     <&camcc CAM_CC_CSID_CLK>,
>> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
>> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
>> +                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
>> +                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
>> +                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
>> +                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
>> +
>> +            clock-names = "camnoc_nrt_axi",
>> +                          "camnoc_rt_axi",
>> +                          "cpas_ahb",
>> +                          "cpas_fast_ahb",
>> +                          "cpas_vfe0",
>> +                          "cpas_vfe1",
>> +                          "cpas_vfe2",
>> +                          "cpas_vfe_lite",
>> +                          "csid",
>> +                          "csid_csiphy_rx",
>> +                          "gcc_axi_hf",
>> +                          "gcc_axi_sf",
>> +                          "vfe0",
>> +                          "vfe0_fast_ahb",
>> +                          "vfe1",
>> +                          "vfe1_fast_ahb",
>> +                          "vfe2",
>> +                          "vfe2_fast_ahb",
>> +                          "vfe_lite",
>> +                          "vfe_lite_ahb",
>> +                          "vfe_lite_cphy_rx",
>> +                          "vfe_lite_csid",
>> +                          "qdss_debug_xo";
>> +
>> +            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
>> +
>> +            interrupt-names = "csid0",
>> +                              "csid1",
>> +                              "csid2",
>> +                              "csid_lite0",
>> +                              "csid_lite1",
>> +                              "vfe0",
>> +                              "vfe1",
>> +                              "vfe2",
>> +                              "vfe_lite0",
>> +                              "vfe_lite1";
>> +
>> +            interconnects = <&gem_noc MASTER_APPSS_PROC 
>> QCOM_ICC_TAG_ACTIVE_ONLY
>> +                             &config_noc SLAVE_CAMERA_CFG 
>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                            <&mmss_noc MASTER_CAMNOC_HF 
>> QCOM_ICC_TAG_ALWAYS
>> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +            interconnect-names = "ahb",
>> +                                 "hf_mnoc";
>> +
>> +            iommus = <&apps_smmu 0x1c00 0x00>;
>> +
>> +            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
>> +                            <&camcc CAM_CC_TFE_1_GDSC>,
>> +                            <&camcc CAM_CC_TFE_2_GDSC>,
>> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +            power-domain-names = "ife0",
>> +                                 "ife1",
>> +                                 "ife2",
>> +                                 "top";
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    camss_csiphy0_ep: endpoint {
>> +                        data-lanes = <1 2 3 4>;
>> +                        remote-endpoint = <&csiphy0_out>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>>
> 
> In general it looks good.
> 

---
Best Regrads,
Hangxiang
