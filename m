Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381021;
	b=Yni9I4FpLVS6pWcQSyQnVFjo/TWE+NmygIQan5mPNZv372EdUaM/GetWBY6eeuDkWQpM
	 O+5NwdSJRqScZ+FNZ1y+6DeB30YjgbAc4ieHMoHhQKMPmqzHBw8G/aPLIwD57cN1Spqvj
	 2Vf8BmLXg/8XKYsYqcuNrWldbRXkQqeMEudT72fD0NYHnzyjmCpivErqtgOKbYe+uju1L
	 moPJTd/Fp1xCD6jOFL9fs6LurWndyOCgxch4oEqBhImMYjeJQRWZnlewl5LZ9ejPTjlJK
	 5Lvp5sWhAORvwwDJdcsuEJkaHvXnnF+Lz3v9a4oN3qGEoS6qNZrLa1+iEEzyKJ0+CAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381021;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
	b=uaytUD4un1mVbyvox6fOeTRc8j+u8IVe6eeZ0/dSjdqQlYweu2kq0eFN1Vp9J3kbUlir
	 Kzl5E2RTK72SflwhYN3mfE/Mx03qPOzvB4p++tssSjQkjreUw1Qwpw9nKcPx6rpaCTdKz
	 zs6XgNNLmJ5jtbCjjGREEqwQNWD19guIGr7aPa8pRAzJsJuIZA/4lottT7N2OG8LirUZh
	 lRAl9HDNlqQ2T5Z35plQuliPZeapr/e1hvqpRkFqUoWXVDw/5yIr7shGIjaZC0D1v71ob
	 AMNR3AsFemUY+eBWYFgzmXdrkNIESlqYE+AvHuh7KugGUpveMxFF0176ar4QfIpa3Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFND5jF5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUGMh8QU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4D3606A321
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 07:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC4D3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFND5jF5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUGMh8QU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KDtM863471
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 07:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=; b=oFND5jF5muk5SSG6
	x9JOIMx9x232dA6O2ATNkn6sWV0UodJv1+B2e7BRi/puHKK8AUR3TCKzZSGtSHU8
	9svUKvzTsi+LNIBpG9WUmauSZVAz3i+BsmJrYHCyEeM/hFW/FH6qgJ3hgeWL35Yv
	uEftjHP0oJPJe+MDww6tHw6iOIcKMTigexvq2AeX4u1fK6vZzGdfnQcYXYTePa2I
	4Q0VtRd+Bvs+LivjFQxX5QASU/L4lovBjKv13Z4D++PI7GQCuH3Ajy6p4jxbeOD8
	i8JlOF6Y5oHK1md08FgF+fpfAeasxFiVwtIyzC3O9rDt6zLdXM/3HCe5kkA7ymTg
	ak0HgQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawgy9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 07:10:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1677021eec.0
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 23:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794381019; x=1794985819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
        b=OUGMh8QU92igMJN+j6348pMjzbKZEJVdC1bAUubEBZAaSb/CcM9ImEil2aOFdxnlnP
         Mruida4AgLaKfJy80n5i+lPlZoGwJrT4tid8ipjhuoQ2BN5q2Xs0fnsLSLoArTBPQ7HG
         r9W4f2HoBgmDkeb4w/v6Xd2hWmIKnP+YnurR5pM8QzPzzQZV+UdW9JmlssXUt+I3r/9k
         +ZhaZ8J1sgS5INCO6wi/pByCibkWrOZ+kvzrCzkJNrf+kbZMv8p6OZ8Uktr6Hul3AN9X
         ser7Ww0tpi/V5wfOSohrPGFxAaj1jO09DCN+FH+/dgHLYOElsiKimEgkGDfwvQRpCa9o
         HdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381019; x=1794985819;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W3qNx39FMf1BOTjwvebsKoIWWMVE5mBaCfEA196G0ts=;
        b=QrDNln6QDI04Cq3iwkhYk+m8bxg8MCgX9BhJ3+k+D86R3OOpRoCyC76fa4IzTkyDrm
         qIcZ1pqYkyDnKIH55N10smu5h06pZdwl8WLdZlJA7iN/hSgUUIOa5pHWGnzisiUU0fel
         OMfnrx/YUvX58rGDyvbBd/MgzKfRfSQoBFTRfsmSlU8krVviwZCarsg9xGyuuCKE9Tvg
         KKhV7c2XEkZAn+C4+YVSPjc+IHnrFk4bTWt5EsDhGHuQO+aBcEzWlS8WfZ7eKVOtB69A
         PTRz/4Pk8xvB1XES9qn5Cmp0dPobgv4nlFU285e2WUzfI4N6lwUkknx4+F+LyzFgxmmu
         pCUg==
X-Forwarded-Encrypted: i=1; AL+hErF6P7PhuGR+I0sG3AaRE6rRQJF+RM4ijL+vNUIu9T5K79gkjAkIWm0QtzVCy6YCVwXzquWvcBnRAvOmXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/N1Ke/9lB+wGO31HA9D/nR+vW9Jkq7D08ikVtbOflsjSIUs55f
	fLu/eQ2B/gag0gJ+7jJncbKGcRvYVskADf35j422NsGHb4l1sWdWqstu6jyJp0U0K1oIvDxiLVF
	1nidJHnk/yx5UG5eNl9ZtOC3a/+TIbHpeOFsmIPz9iBq67/S4a616iEogQOnCJA2hwA==
X-Gm-Gg: AYBFou1cYZIeeYTov8x3JHaUVHOuHO5Hqp535CuosnBtVLIhTjTIQgT1mV3qwvt3zjr
	ZZps4+n2FqcIqpEe/G9xmhvz8jJDjj3YHHCiYIrFY5vjYovulEb1FM9SYipC5DONFzvXcjRGFzA
	ZB+GSpmhzfIujPA8Q+Eeqd971tc0o0v1ZhCxXt5a4/T4eo2zjC0gtjwXQ9ug8UPJOxdNywG3fOo
	AlrHEPdUAtUSYT+c1q3CAHTLxuxkzRNl3TpL1Li/7wvN3p7s26/SQ02AY8GDI9m1ojDDpti0N60
	srGl2RFVPOmockAafB8yVLCfOBhJsmHQ76AgIkSEz7btNSTzNgqAEUW4vubXbjocWxxD5ATmuwm
	08ZG+s9gkaxxA2qrUp9SxFWeSxLEL3msL6oZSJh/lsgdGbs1PlSnTpxTVA0kvcZus0P7flOu3K9
	02XIHAIFM=
X-Received: by 2002:a05:693c:62c3:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-37687119518mr1917690eec.38.1794381018931;
        Tue, 10 Nov 2026 23:10:18 -0800 (PST)
X-Received: by 2002:a05:693c:62c3:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-37687119518mr1917632eec.38.1794381018145;
        Tue, 10 Nov 2026 23:10:18 -0800 (PST)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm12686718eec.11.2026.11.10.23.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 23:10:17 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <2fb9fd90-fac5-4a9e-ac7e-5dde689d8b80@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:40:05 +0530
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
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: iommu@lists.linux.dev, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Simona Vetter <simona@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>,
        devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        linaro-mm-sig@lists.linaro.org, virtualization@lists.linux.dev,
        Jason Wang <jasowangio@gmail.com>, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-media@vger.kernel.org,
        Mahadevan P <mahap@oss.qualcomm.com>, freedreno@lists.freedesktop.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Will Deacon <will@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Philipp Stanner <phasta@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <179304379330.2965544.11793708430519844335.robh@kernel.org>
Content-Language: en-US
In-Reply-To: <179304379330.2965544.11793708430519844335.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfX2KvgV7sYWzRX
 UuBWie+M/IQCr4qwJj9j9rxrVVTZeeLv1Sk3H/KKXtMq9MZmd+BMwS66bCRyogS14UpaWgmDyYH
 w0cxKz93pB80vv3qysnHA2HQ9vjmFSw=
X-Proofpoint-ORIG-GUID: XzcasHX2xYP5ZZA5s28EYqQbwQweXmXF
X-Proofpoint-GUID: XzcasHX2xYP5ZZA5s28EYqQbwQweXmXF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfXzlI0ov3ait6n
 5s0oNbkmhH1Drlap4FZJ2vlaYm84s/INKZ3W1b1r0yHtYS12UWVo3DuKQDfrsI57GY149CTi9vM
 FIRT9SfhUWhcHZtVs9LXQdhh8Vq542h2exrAz77ecdoLD1jn+2WsZRMgFqtpPFSQvSrRpNCaoih
 vkv/jzzySHGCjchq0H1icptWb03dlJ40KDoWCr9MlKP9g8u3H7XCC55w3sLyCWjTf6y64uFHlvd
 IoQc61mi+GaZc6ST7QaiSYKRWn2GSflix+iywHR1NPakQhV7A6N1mPfdiI2M9OWWnRF9HNZT/pO
 VqfXM/olgti/S3A1AZYHcR/ks0cCxvb6I5eq//D2V16Oo5UQDU+fIZ80w4deL0LgcyT78fc0/cd
 UqT4KbhDo+IMQtgQCqYIDcjiZrNQsHcqKDttHZFPp0T4MPRzRQkARQsQRWrdwRG26yRTWuN/ycb
 CVumatRumcSzZHXbaaA==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af414db cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9TjDuG0S92mpM2z4UZQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110028


On 27-10-2026 01:14, Rob Herring (Arm) wrote:
> On Mon, 26 Oct 2026 11:51:11 +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the Qualcomm transport
>> wrapper, display topology, IOMMU contexts, and panel connections.
>>
>> Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
>> subsystem. Document the IPCC power-notify resources, transport and
>> framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
>> DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
>> after the IPCC power-notify sequence has completed.
>>
>> Assisted-by: LLM
>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/qcom,dcp-dsi.yaml         |  79 ++++++++++++
>>   .../devicetree/bindings/display/msm/qcom,dcp.yaml  | 123 +++++++++++++++++++
>>   .../bindings/virtio/qcom,dcp-virtio.yaml           | 132 +++++++++++++++++++++
>>   3 files changed, 334 insertions(+)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/virtio/qcom,dcp-virtio.yaml: iommu-ranges: multiple incompatible types: uint32-array
> /usr/local/lib/python3.13/dist-packages/dtschema/schemas/iommu/iommu.yaml: iommu-ranges: multiple incompatible types: uint32-matrix
> Could not decode node virtio@9be8000 property iommu-ranges with value b'\x00\x00\x00\x00\x84\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00'
>
> Traceback (most recent call last):
>    File "/usr/local/bin/dt-validate", line 8, in <module>
>      sys.exit(main())
>               ~~~~^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 443, in main
>      dtb_diagnostics = sg.check_dtb(filename)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb_validate.py", line 331, in check_dtb
>      dt = self.validator.decode_dtb(f.read(), decode_errors)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/validator.py", line 631, in decode_dtb
>      return [dtschema.dtb.fdt_unflatten(self, dtb)]
>              ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 591, in fdt_unflatten
>      dt = fdt_scan_node(validator, fdt, '/', offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 320, in fdt_scan_node
>      node = fdt_scan_node(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 320, in fdt_scan_node
>      node = fdt_scan_node(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 312, in fdt_scan_node
>      node_dict = node_props(validator, fdt, nodename, offset)
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 258, in node_props
>      props_dict[p.name] = prop_value(validator, nodename, p)
>                           ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/dtb.py", line 185, in prop_value
>      if len(p) / type_format[fmt].size >= min_dim:
>                  ~~~~~~~~~~~^^^^^
> KeyError: 'uint32-array'
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.


There is a dependent patch which adds iommu-ranges, I had tried with 
that locally and it passes.


