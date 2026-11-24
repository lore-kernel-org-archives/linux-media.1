Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537681;
	b=Rw9EpOiYby/pgDG/pzgku6fCDPF9ghtdrpmCAs3Lf5wV0rp2jXNhOfjCSWgxWO2fltBf
	 Vll+M6vZCuA5EueDD3oMwH7enM/y/OjgP+esvhdY79yGwWl/X3FeI2BRPCZtxWYweuLaQ
	 6LPXRx65fxP6qdyn4jDMmTvIiStK126JlUFGJYZBUnchoD8/WmpndumNFENNeja46hL19
	 Kf/7VhzdrUxVBVzoeWTb0l3v+dgBj3OQoje0/dVcWxbH2QuTm3bcSfslCcYfCOWAMnpbO
	 jsXWZNJgoZZCaRIiPmhzr3VgOLH/eImJ6t/Hq+X495RPhi6TlczqOLChzQL0ec3+u4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d58a8k7Ag8RyjtNWscWP83umObNtOqXz8RFowy/2qhI=;
	b=laEAEeugNn0PksCqFRqIihCCGHBy9pf2D+czu2zFgs/y1dPkO74XYxeXL01Pjk6FCApX
	 SMQKR/GEldEQSfWv6zGArAZQHAjEJIcL4VSMB+Vej2kMA9mCPq64b165BqBR0sPcM8dos
	 5xQdZOeivhJxacFYGbBQL1nBab8Yy1s5wEcQ0jpRcrP6RwHLQ9GBVGWS5rpIahb9m7tsJ
	 MaNCo7+uIuodG3TgCousEYfLvAdRCqm1YXpWfry2W3n1M9Cqp4CK114HytD2OhvaLV6Qq
	 3brd11l95tffE4gZz1A1OEErXJRNKhB6VDFZ37Uq5J7oMC9woUjYfzeLqvwco8dLnqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C4DA0VbY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHKEEXCq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FE606A31E
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 872FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C4DA0VbY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHKEEXCq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL3I21873400
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d58a8k7Ag8RyjtNWscWP83umObNtOqXz8RFowy/2qhI=; b=C4DA0VbYV5igizpH
	EQ2/OB23ddWtIEsMGm0ISLo9OBccNx+ZaVZshnU+UXtNk6VS+HOPIAlftGWas3T0
	tPIKI6DvydKZ8s0DyIS5u0KaPwo0FetgqoMKsd2YLn7xlsmx3l4ocy4fmBh+rJIr
	CTKBJL21oCuwl5g5HqFXpKsHXoMSeDQpe6ND/6W9h1+F6dU/0JpiruBP0aUHLtHO
	i9LRtLBZDUWZBlgyIU39/9XCh4hQT6naVq/j4Fe3R64VnKApbtqhdd+Yk0Se6rH5
	cvSvjLmGQwvEOSCYtUAZ4LonCKeu6TnxJf1VZvbli9fI4bRDIFUS5JrqgeGOHyQ9
	BSuD7w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk8cbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 16:27:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a603517dso304465eec.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 08:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795537679; x=1796142479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d58a8k7Ag8RyjtNWscWP83umObNtOqXz8RFowy/2qhI=;
        b=PHKEEXCqtBYwe4uMoDM4rUk8s9ru6Tj1ZHlCDHLGkOrvz7OY6+aF5tcRi9TwpL4JTl
         E8+Roqnz5toIv5Rryuu3N/CUKxTzEgp2OzhYXpbbahG4HeQ3c86iXxs0Uy9w9JZbmjAV
         vVXrw4rVPdNzSBOrMWy6TyUefaMfNspFE3aK4WTTiouHg2NxvhHpugYJgY8ViRKHsJKu
         aVS5LfPGFFfRjIhxOogLiWbGsJTtUSOXIMg0YjnsVdVSivhz2VU0qH9oqaWtLcL3U+eX
         6BwqRZ4cLq9qhu96UQi+9S/0TqUdBi5sh3eH1GwOUrHwbS7GhnafyiA8maBoo8cyNoKr
         08Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537679; x=1796142479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d58a8k7Ag8RyjtNWscWP83umObNtOqXz8RFowy/2qhI=;
        b=O+UvwWKEfIwgvVBBgdR61hTbZWRdbgO/urpWW9mbqoqB6x1X4w6QWhBGlHJThubmR6
         WS3pk+zFuqacFaCtdaRutdoIl1K269TtYwxqV40aR5NweHz7da8O7ldvZRUSQj20GA4R
         D6T1TrbfNFFbSBoSLu9qIlvg4pIWlvdGvz3enX7hMJrUMZdz82KpwInhfktunCtwpv4b
         ERwHd3zrYHln8FQak5YMhiN0FgX9orswVZPf62q2nQAFcbCcqu6HYfzun49q6e0phOiv
         JlZkZJzad8Jh0ob+5T26c8YGPsMb9WjZ/GbB/bF0I1x3JREkF0fM1rcXK9T2MoByk5c1
         Lquw==
X-Gm-Message-State: APuU4Z/yKI/M02UCj7htosAMv7CO2jAAulySxuQLefp5tLUbEzfqhV/3
	tYzV0PcuC6qjhpz25ktYXF+nqHfW+oP/u+QDvqzLTFdYxMT0BaoW2STOkJVqX9WfpTS/s9wqX1f
	jx2GD4HGkdkzgh3fw4tmhIpc7bVGwYjOf92Qo7rn9aCNWvGbD3m24Z2cCgj0uDDWvSAQiJFJPCQ
	==
X-Gm-Gg: AZFdTZfSZK9aC2C1Ex5BJM0/cgKHKI1oSnNBfUbmfmaX1xKxad6RnFA7qLh6sm0MSmt
	dl+wJ4xAL0xUrpJC+TSKAMLvQLtr609x4AdmGZNuE5+qISY1ojIZRei/n1xQtfESGNaRtrr/PmF
	xc3FfRHwZ+fos8BquXpQGVXIpBrEph+VOucuLjYSsoledGv2N2fWr+W/w42fwHSfEiTrftkdZ8S
	hUOa5bFDYkvuN34Ms416v366w1SI/EQeI9BTEUFNXyCZby08G7uQ2LB9Cxq5N5PNT1xfL34wOgl
	H3NdZo0G/mFX9HzXyI87z8VJ6oMATjB9mdArn1YLyYkQtRbDEv6zeX9MpNGwRCGEwRCoosHlMEX
	UrfUAWXJeT7fnqJK2wIzCKn43Cv0QrHXZRguPyQOSm0APg+d0bnNL/qghPjuqgbbgQNa1IDiy6D
	37IAb0TFk23/g=
X-Received: by 2002:a05:7301:6187:10b0:386:a8e0:ac22 with SMTP id 5a478bee46e88-386a8e0b29dmr13263871eec.0.1795537678691;
        Tue, 24 Nov 2026 08:27:58 -0800 (PST)
X-Received: by 2002:a05:7301:6187:10b0:386:a8e0:ac22 with SMTP id 5a478bee46e88-386a8e0b29dmr13263828eec.0.1795537678070;
        Tue, 24 Nov 2026 08:27:58 -0800 (PST)
Received: from [192.168.1.210] ([76.33.11.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm43393831eec.16.2026.11.24.08.27.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:27:57 -0800 (PST)
Message-ID: <8129945f-5900-4180-a527-e877a73b2ef7@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:27:56 -0800
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
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,mahua-iris: Add Mahua video
 codec
To: linux-media@vger.kernel.org
References: <20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com>
 <20261113-mahua_iris_enable-v1-1-b7107e1cbcaa@oss.qualcomm.com>
 <5de47ef8-58b6-40b7-9c62-f4c306cceb40@kernel.org>
Content-Language: en-US
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
In-Reply-To: <5de47ef8-58b6-40b7-9c62-f4c306cceb40@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NCBTYWx0ZWRfX+cTM2HSkL0vs
 fy5Kq3rtLA45M+OrzDGz/ur5yAMzkTcksY53PbVhWBhFfOsdc3n7B63USgxh+0NdoJqpcnw4Oj4
 WjvnPnHTK1IDd2jqz9NKuFn8Hk0iSO1vLNnYE0sM3XYl78ly9yC+f3jbGyXevYl5klxEczSE1Hn
 k6IfaOgvA436cRB7EEDTs/bgdkyhaZdXa9rZ8kSMzqdeOryrd5l5GA6/5uKYhtHnjj+FehmV0JB
 aZpTLKDoYf/bg1ivdnN/e1XKDvLqhxyEWI5P308H+IPJaOaKmpDhCoOh0GRFgivZZ/5etLIDoou
 Yc8rhRI++oYvm4L/4QwuL+l9Ud24RLOu/LShtnRydChrZnik698pmNEHE9uXCYYVoja/MO0OU+S
 qqQ78cDcmDPodrXlGA7hfRjEp/Hg6TQsXUbrzChqZwdE6VvSDJ2oGFVzaW9FaEHa64V4F4KvDht
 KJUCSIl8ziNm2eRHwTQ==
X-Proofpoint-GUID: W36l1uO5msf-VH2ikjwVdwEpcsMv6gsy
X-Proofpoint-ORIG-GUID: W36l1uO5msf-VH2ikjwVdwEpcsMv6gsy
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05bb0f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=yYUYPLL3N79xqptAUcuwSw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=iyAQihupaczbp4OveGsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NCBTYWx0ZWRfX8+A5cfj3vJxJ
 XxPbaA+48z4HiuuyS1vSFEeTfQoB+bgHGf0EpmxZFweW+Ki0MoXS1ljVCdC0m80SBeDWVGxDSHj
 0BA5zw3MRIPv6mkeDfp3rkHfGsboSVo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240064


On 11/17/2026 2:45 AM, Krzysztof Kozlowski wrote:
> On 14/11/2026 04:09, Deepa Guthyappa Madivalara wrote:
>> Add a devicetree binding for the Iris3.9 video encoder and decoder block
>> found on the Qualcomm Mahua SoC. This is a single core derivative,
>> leveraging most of Glymur data with the clks, resets present only
>> for vcodec0 core.
>>
>> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,mahua-iris.yaml | 243 +++++++++++++++++++++
>>   1 file changed, 243 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..cbae6bddf7fd4b67330ce47033874f3d349e5a3d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,mahua-iris.yaml
>> @@ -0,0 +1,243 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,mahua-iris.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Mahua SoC Iris video encoder and decoder
>> +
>> +maintainers:
>> +  - Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> +
>> +description:
>> +  The Iris video processing unit on Qualcomm Mahua SoC is a video encode and
>> +  decode accelerator.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - const: qcom,mahua-iris
>> +          - const: qcom,glymur-iris
>> +      - const: qcom,mahua-iris
>> +
> I don't understand what you want to express at all. See DTS101 slides, I
> gave the talk in Qualcomm office this year even.
>
> Anyway, glymur is undocumented. There is nothing about dependencies in
> top of the cover letter (sorry, not going to scroll further - you ALWAYS
> put the most important information first), but anyway then it means this
> is untestable or unreviewable.
>
> Best regards,
> Krzysztof
Sorry, updated in v2.
