Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52563955F0
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867712; cv=none; b=Dgne0o4OnOdtjXGDllJHKJZKJXdZwju0C0QgCBLwPdgDfDnykJXfSQgJ5T2VARVmlTyYZQXilw9fqV4wA57WH7hL5fwzTzqTikxhEtJGAKF8Z1aUtHF60SXT/kTCGzPizIu7ghiWRmRSDXtQFBQ5r5MLYc8in7PcXsBgFWU6f2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867712; c=relaxed/simple;
	bh=a/SRqoYq0Cxxl/r6VpLOM21+EkvNzndqU4lwE3ztC4I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nak9SdlRS0R2PX1iDaPFna0ylhrkbla7bUBrHFU1ao4vU02OENs7nRGnU/4BnrhbI3M/sMPnde2SfPJoSnb0Fpnpy0gk71snYGAIhjBIh+kNfi8mng/v06j7Yx4VZSTNs0L/0XOz9esYX+cucrk3GHrJC5seBzZOb9FMAPCT3Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuABj3ja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLxhvibV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuABj3ja";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLxhvibV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjG8m2403830
	for <linux-media@vger.kernel.org>; Thu, 1 Oct 2026 15:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPMmSCRxjG9SdUNYnJgV9dpORjENF4sI3Zy3HzekM3w=; b=EuABj3jaUrax8Klf
	54DQyvwu2m9mUN6n1ObDUXZGd8mDqoWedgIEzI+YtoV38NQSbPS8xIHERpOLrr2Q
	uBmUk/oQYiiTfAhwM6Ns/0GRxAGSXFLCQleVrRDFJzVVSwTCQTTSbzTyjGQZ5M2w
	l8t60Mpn0SBM+1/diaeY6iPpiFSwkbJ6/KYJwYan+i7+pypPQxF7gDkz4Ue6sYOO
	oGgb1Gl2XqOKBJ8MGF+6D6dqaPXI35UVWIsg6aH9Cy9MPe6oXtYbAeBRw6F2tjN+
	JjwJJFNmbZiq0KpqM6KreyD27C8CdB2CFwRmEYYWgJ14egLGUUIn3GvbENiJ7o4Y
	0i2hWA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188svddk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 15:15:09 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98929c3b03bso1300344241.2
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867708; x=1791472508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPMmSCRxjG9SdUNYnJgV9dpORjENF4sI3Zy3HzekM3w=;
        b=DLxhvibVdV9yRsYpN5et6wMSVXzbf+0nsqOxwqZ0EByJ4Dqoj30jzuTCp27QIN8Zq2
         GjBrMzFd3cOZ3cXEeasb0xRsKhMzoVFnEahtLp5AdrFnXsFP0z6mFx7KVkmsKYjASQDR
         lS3vr280AhET0GG3oJIrgEOFCV5GncVUVdFASLxVa8jXB4SDREaMOlST17ihaaZEW53T
         YiHzup6FS2/OclRofM8dRs/eofRpuQ9fyHt6BkAkxmYX0/+DdZfjCBydD4jdMYqrJtHU
         PMDOde4CTnXfnArnDCmI7I0ujVH0cX0Vd1Nz6oIx2RX6LcfNLixj6v6d+dF4E+Fi+v5T
         RBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867708; x=1791472508;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPMmSCRxjG9SdUNYnJgV9dpORjENF4sI3Zy3HzekM3w=;
        b=F6aKbvTC00uVOtJo5mqfdtH/FE3i0zo05XJFeL518lOidHF5tlxQaoi3ko2mjg+At+
         rRCZ1nliKdVKs6BUF39TnSG0cdd/xQzEyq6xtjWeyThfPSCPvbAHtZaSkazntV9gbjyk
         Ure5kmrf8WD4T80MaC+JJ4NkX0VH0RGERm8ZdmulCeBAu6Ng7fY1aRKO+7cONzE1PLy2
         02x1Vpm9By4yAVh+alQsbk5as3JBOzP/Ggh8TEISPpZhrC2vB9s0NCmlKucQvX9w9vdH
         YaWh+1Rp55kPhNM5ECeFf6oPjHHr5S5jovHkuUufl/IHGHDfPSSSU2kJjLYZ/o/RDc9A
         JyeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCk7IYvnFKeuiZgDnVVbUgWaV3m5vXj5tXVhSIXS9qQpcohPPghHEQleWR6FAKr9nughF0n84OvWVAXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+frgk4z4fdBOT3fZf9yY/7EYxv/tt/0K9D2fujlAPXwsZzDk8
	jJWzbTYZZmy6ldh8kAUBbBCRlkMKwUE60pmP2K4f3gxKi7MPwNLDTDwQ+dNrWpYBEbB3bX3u+SW
	BewdBYxysWagH/eKod8kPhSbzhXy/4FpUIXZ7w5tJV5AXt30Se6gIN6G0CM6qP28YEw==
X-Gm-Gg: AYBFou16ao4FEX4uzzg1ZG/MHbuL0xtcK7Wyw28YBzO0bPVA9/INq6FvODVPyY/jK8v
	PIQvPB9uZsNG9Bjx4rui36m9Fm8AUEnIDJpXHD/NnGuNrhnKCHtCcfFkPbBO+IO9Mn2TIsjlWCR
	OIi4li4fZzBY7rKgSps1W9+CNsV2uGuySXgnI/yGisEF8s1tWOUOohMUwfmSsjE1AtwMyZvCe7W
	njU2bcLfZpk8nPxwyP37Jzdu5pIteiWSKpR3bE9jjwgVZhFFlGiMY3O68439szWREcx7jS0eU9d
	BxEwEaixQIL6ogjiJ8pSK049vPPIvGOU8ZWwEVQoTvrmqIKNbQHXvN+hkGmc81rEdjvp+9kVqsl
	e3WoZ7C+CNPL24lLj2w2vfFIgRvG0xKAQiT3tOxWhrGrsgv3ccj5lkUrrqGDVcnK6kEF6UYT9qN
	7Gu35onvJl4PMau4uOlhtPnl/2NAIN09TdQIpgx4m+y2xg0QNRR4/zPJMuziP0mgvuXVU=
X-Received: by 2002:a05:6102:6449:b0:7ba:9219:cb54 with SMTP id ada2fe7eead31-7be7457d4cbmr1919536137.34.1790867708497;
        Thu, 01 Oct 2026 08:15:08 -0700 (PDT)
X-Received: by 2002:a05:6102:6449:b0:7ba:9219:cb54 with SMTP id ada2fe7eead31-7be7457d4cbmr1919527137.34.1790867708048;
        Thu, 01 Oct 2026 08:15:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e387b1d4bsm125247566b.25.2026.10.01.08.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:15:06 -0700 (PDT)
Message-ID: <ff4290aa-8edd-4135-9260-3bcd0361fa06@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 17:15:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
To: Stefan Klug <stefan.klug@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Cc: Loic Poulain <lpoulain@qti.qualcomm.com>,
        Michael Riesch <michael.riesch@collabora.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <93b0e5fd-5570-4418-8bbc-4b18ef5e419f@ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <93b0e5fd-5570-4418-8bbc-4b18ef5e419f@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX9azu3ldKfTur
 8RIz0yp0nZpi79pZCN/FUaAo87V6JVphPIWMfY9Md+orQXpsOf3yxYTag31VjvEZs0O57hc619y
 XVSPFtWdokziAGQcFSBujwL/Qc02ZBk=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe78fd cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c7GLsNvRDVQrI4307dcA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: J-xJflc2SQpOx_UdG0M6jL5UqKiI7XWR
X-Proofpoint-GUID: J-xJflc2SQpOx_UdG0M6jL5UqKiI7XWR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX1UsoAA3pGiPy
 GNHvXrxsfLaEeWl2jyZrCfY2Xrtf5QCAO6ZYBQLp0r7xJLNxgoR0fnv0bnwfBlFsW3Q/TnxkrQQ
 yKgqT81CEiiLknknmZ+gcLEILf3+CQ6ExTTJoziy2mb/DO5ABtiyOiAv91BVvUKp6ectDnQsWHS
 KGZMIw2J0xgxlRLRDnhxxbiPm6HNagOBqELlCLcOC4tEQurnCdIvVx6lKUgtJQAhkFW1+06AI0h
 rrGok3eLEBWKosqLDBUL322kOljLJBkZMgSrgxgvSNB9cxb73qJuGuPL0kVjdtJNQX7PGGlUUCS
 bMihSrurclqW+lmrDSmtymJfndh1wzWvO4k0peReQiz1M6U98RYIcXj/79YosAeGf4UvQDF8Ho9
 +/B1p6itKD55UH2BFW3maJs2FhZQWar9iGzKzM8yphfkGuV7XSDN53V1bXXgPcKzyt93RepHVZC
 kltp/YWr5ICDj24sYIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010060

Hi Stefan,

Thank you for the write-up.

On 30-Sep-26 13:18, Stefan Klug wrote:

<snip>

> ## Diving into the examples
> 
> Lets look at the example I listed to see how these would be solved.
> 
> ### 1. Laptop with camera module from various manufacturers
> 
> I believe this can be solved by either integrating the detection logic
> in libcamera and/or adding rules to udev/hwdb. But we are lacking real
> examples. So if you're able to provide identification strategies for
> real, existing hardware, I'd be glad to know about it. One strategy
> might be to use the machine identifier provided by DMI. This is however
> quite coarse and can not handle cases where the manufacturer used
> different camera modules from different vendors (using the same sensor
> model). ARe there for example ACPI properties that we could query for
> additional information?
> 
> Q: Does anyone in this group have more details on which information to
> query and where to get more details from the system?
> A: ...

For the Intel IPU6/IPU7 methods there is an ACPI call which the kernel
can do on the sensor fwnode object which will return a string identifying
the modules. These strings don't really have any fixed format, typically
they contain something which look like how some laptop serials look
just a random bunch of numbers + capital letters.

Userspace cannot get to this without the kernel exporting it.

Given all the udev talk, I think a sysfs attribute would make sense
for this. We can make the kernel do the ACPI call and if it is present
add a camera_module sysfs attribute to the v4l2-subdev for the sensor,
which will only be visible when there actually is a module-name.

On laptops using devicetree we could then fill this from a devicetree
property.


> 
> ### 2. Camera modules with an embedded EEPROM
> 
> To make use of the EEPROM data from user space we need to carry two
> elements: The EEPROM data itself and some identifier telling which
> format the data in the EEPROM has. This seems relatively straightforward
> and we could model it like this in dts:
> 
> dts-snippet:
> imx283_0: sensor@1a {
> 		compatible = "sony,imx283";
>     ...
>     eeprom = <&eeprom>;
>     eeprom-format = "vendor-a-eeprom-fmt";
> };
> 
> Getting the link to the EEPROM from user space is something to
> investigate. Ideas are either sysfs or media-controller.
> The eeprom-format must be specified as well, to tell user space how to
> interpret the EEPROM data, as it is typically not self-contained.
> 
> Q: On a first discussion on that topic we were unsure if it would be
> preferred to expose the data directly in sysfs,
> or to symlink to the corresponding sysfs entry for the EEPROM. Any
> preferences?
> A: ...
> 
> Q: Any input/things to consider from ACPI side?
> A:

For IPU6/IPU7 eeprom data is not used for camera-module identification
(AFAIK), it is all done through the (custom, Intel specific) ACPI call
I mentioned above.

> Q: What happens if the EEPROM driver is not loaded yet or is just not
> available? Should it block/defer probing of the sensor?
> A:
> 
> Q: We are missing real-life examples for these cases. So input from
> vendors would be welcome.
> A:
<snip>

Regards,

Hans


