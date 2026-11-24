Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502652;
	b=SQXpmpEUtO17cFhdY6XhB0GLcBiDvZQtIiHa5fHNXQZSu7iWD4c6NITn+JYBs/EHDIb6
	 yL6Skk8ppFK30ubq3Jx5qM3HS7MKWrtjE/JriTNP5eEJyVB3DQbI//v+YkiqnsqlZCdgF
	 FlrAbDcnWm2OPub3UhZ/xgZZPGn/nOP+TZcAzuULrJm7od7X0++pQQH+BdTXsUDdn2YJS
	 VsIgM8aRqUizTxK71ajf01D6Rc4VH2FU98PUas+iC0rGvVf09PAV1S+85vz4rDgcmElvW
	 2tzX/SO65OPQ/OkUAeU12jEHEZW0D3vVbvtnh9SpJqbUj1ZeWXJyzekl+hcXaU2FMGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
	b=hyVxfPlAmBWe0AWHt7qmeYOH9SVpLaAMN6V4AHtK3IUBWtVWBVq6P7qEWtt++S98HUSF
	 Ja4FlO2E5lvHVXkmU0aOs4Ahqo0M3QQyK0W9T4/qQMQhVgjX8ArCrTgZXsUYC52jevnXY
	 TMriWxq+2PIbRFWiZ6t8LREh9dyb2GN2leZsofINOhoK7P/gBUJ/U5jVjH/9Yoy085ZrH
	 uWhOpZVBONrSgCB95ILuBLsTZCNxkIiog9pDi8OyKrV2atA4zRSjZhSCORgqOR5GJu7yj
	 X04kHXJggwPphiUjmCXl+GF48WiKg99fHCODbC0hqRk2+FBEYo2519uBK5e3JgqcQfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KeUZzUi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EbOwuS4C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0DE606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D0DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KeUZzUi8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EbOwuS4C
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5lsIQ2848168
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r0ByY2X0iY4Mpi/euGIX6Z
	+pt0UGNEDDDpkbV82aFgU=; b=KeUZzUi8LBi2ZjoH5n+PnElc2J7ns4yoGnGUXk
	30iU0Cw+cM0uidj1aWkDFexzRMktgs9pzNaYxLOj+MOzZCnNBVK8lZ1x/Sf+2Cog
	PbdzJm+t/SjepQ/OKITnPy9QoKyu/OAdRvUY29Ko6IeL2NpvrhhlYrlh84i523fu
	s19Kxt+KyE9OVc/6GTZpE5gx5hr9NVjcGO8YTdx+py7/tFSTEJTkBwVQS9ZXfKlU
	StLFVUFhsPUwkv3l/X5qV565+Ce4nqzOmAlRU8XNqH2SYWDv14L8IphNGfeHp6q7
	c591O6AqiVWDwbLjfwBmY7Y9sE1nR2wODJlhmQuLUgm/rr7Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh8630-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 06:44:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384b6a33735so456379eec.3
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 22:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502650; x=1796107450; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
        b=EbOwuS4CtFRUYv0ASVyl18hgBmZWbjXl53GMgLRtstSVU0uOTCKXFJ/utAbp94tOSd
         qLu235uuUqB2wsP+DNrRZsVdjaSzs2Plp0K+hyB5l7GbEeZ6k0/CK79pzo/vNWtBkagX
         FeKjwv+be0OS0kw3JKqvkqPkPjG4ZmUT7Iv6n+2022uYfK+IpsxGZflQnWsxbr+kwW6l
         nyev3RYJXU4tTrZARxrbw7b7YyfaM/VCDe3z2TvdKJZ8aZ9KEmYvAxUJxBwWPzv/7Ri7
         t0yoGrwCSceW9fqQj//xAuXCuzeDp3VvykMxW9L+qSorfry9jbkvAtmIpAEa7zIRzAUr
         lvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502650; x=1796107450;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r0ByY2X0iY4Mpi/euGIX6Z+pt0UGNEDDDpkbV82aFgU=;
        b=cwe5JeYzT4N3hWfgRq34WDq0nZA7xQx3+1r0jveLctkPpRkysA4evNKImv0ZNzdHmo
         g7ZF25DyIUWzp3PPwX69CtRWTtF+UDT6lcqgCLckMy7I4ik/jBPcwkPNZ6f9wYfJzMy3
         D6bw3J6gMnWs5wTPuZX3+NNcwlkNWt5eoOo4eN6UIyjHYpFGnixPjW2+1B3kCOgTcRYs
         bH0bbluvEhqVw3hEZQcsk0cyWZmOIrD1+v/EHMO6unC2ad0a3B/5qdaNhadf8JI7pOhS
         E1sUlSkex6YkF0pGB+rTiSa1EmTkuEDPzlf6L3AVJX0F2GMteQ+clRdsWWBo2mtXQkcJ
         uQ5w==
X-Gm-Message-State: APuU4Z/20VXCpuq4FRMPz6wKE2UK5bdpB+tV3nuQGafV9fmXgskDr5es
	BjrJC0cSi+XTftmlbtMRfbA2oXKirpFaF5BamHZuITFp5XHUXg+adVHiQkeG/D0NjTEh5dccPSz
	MCpoImni6CAPszGZBJZ5DiYblwGU+xaKYZmCl1NwNQypyHRJo0rOnqZVhgX4Ib54q6w==
X-Gm-Gg: AZFdTZeVOyoDFa/nhCsUMw5gX5+aOb1dfBbJmrNdz3/uvImqOiMl8W2hGbKNRIouSkR
	podqbSjkTjE/Q8NfPrNII/yV00kmGFWEDqCusabH9tfLofjU4WQhu+04tY+E/2Ag0DhCrG4Yn+p
	sJBqtjK6Z4nGV/FEhX2mtF3dQbcwZBxV48GIQ90XuD7ue8bMix5pT5lhfvZ2eQ+9lqlW+DThTEz
	1BX3qBVXMCY04PQafNFsmX+99rUwpiOXRQnPVCkLUTASibjPm6YRGrmUUhWi7s0hAy4oLJIc4VI
	cRsVJ2L3wUUpgooZxpJqQwRsfnEJadAWS/BJZHoyRgb++wHFDvmA7fbYdEWvoFTI0tWytlVtQVM
	cMGbNozmTG1crXuA9Q7dknRMqmzdmOOSttgplZHkyWFbZ5tGqXjYidzIWQkQkQuyQuEKHo4NtqE
	z4mvKLPBnxmVvbuR26ctqyopYkXGPH1MTDPg==
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21860136eec.2.1795502650371;
        Mon, 23 Nov 2026 22:44:10 -0800 (PST)
X-Received: by 2002:a05:693c:8211:b0:35f:ea17:d171 with SMTP id 5a478bee46e88-3856e74909fmr21860096eec.2.1795502649741;
        Mon, 23 Nov 2026 22:44:09 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm39265484eec.29.2026.11.23.22.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:44:09 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: iris: Add support for mahua platform
Date: Mon, 23 Nov 2026 22:44:02 -0800
Message-Id: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADIyBWsC/32P3YqDMBCFX0VyvSmZGI3Ksux7lFImyVgD/mwTl
 Zbiu2+0lwt7M3DOMGe+82KRgqfImuzFAq0++mlMQn5kzHY43oh7lzSTQpYAkPMBuwWvPvh4pRF
 NT7yiPC1RoVCKpbufQK1/HJnny1sHui8pen6bbKAY8Yhuss89WdSg+a1/DkvgKwAXnIStjK1Ba
 SW/pxhP9wV7Ow3DKY2v/Y3BSHx3/NxkwtVOONPK1jnbtkVV1K6UOdXCos6tEoWSuiRgO1Dn4zy
 F59F5hYPon3rrjmM0CE1gjUX8g8Mu27b9Atvn5X5KAQAA
X-Change-ID: 20261113-mahua_iris_enable-8e3026a4a044
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795502648; l=7521;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=gUE63zVZIVeUvmErUr/TrSMTqv6lxRJ/fp5Y8KWuPVk=;
 b=Y1VZuEAlW8OxZVs/P5hijwld5rvuRABQSv4jF35P3GPgC1wI0Liyvj8dL6a7vzpi+OfR+zpU2
 uUCeSoFky6SDjvqu3IcD7+jiVH53dEAGSc6UTU98lk4nfCTFoXJT5nz
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05323b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NlngLaH3A2d4KlUMbl8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfXwtPHzHHOzddB
 tcVR+IT4p9AFAajQp1pvlp2PteiLFKOwbGvDDngFrogdAchTnWaENqMSdAJLwe+wHXzZ9EowsJN
 8EfXKy90Ki54j4ePtaObqnDMd2re218=
X-Proofpoint-GUID: kDySJFYooiZIthlyD9G2ptNsKDLu6wx3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX4P+pTBiJOFLp
 3EcFpM9J91ncdcYxive626cNqutwUEQlVk/+J4ITYvImW0rLC4mknZ9dQ3fg7wB9P8gFD35lMww
 o0Zy7CL1Efic9MYoLyIygHb4RsIfXk5MaFOJG9pfjVkoomZeRYivngXgs6w6u/L0iADm2ZtrysE
 PZAjV3XRFlT/RxXTDHggccXYO2DIKB67FphohK2eYHQD0JFzhWr11JwrXiMb+GOdyoG0d1znOel
 MjcXqmYELWKu/Q3zo4a3XXL0qRZuk01m/UiK6wJ7QEAfYZSmHcuKN9smoU6iWcp8pIAeq4LmjBL
 P0oZkH8U6lKtvKAX7FbWqPqCCKtk6C84YJCfVbZ9wcbein9dsH3Tt9gO7wfVdXjO3xIAf34ekiA
 9aY95hfgvdLbW9Hr3myWP1beJotOs+Q1RdzmSUM15oyY4bTlWp+wzPnuEeV1+QlvUP8dD1pEhDa
 zWapRq+tEs5oJYaCoAA==
X-Proofpoint-ORIG-GUID: kDySJFYooiZIthlyD9G2ptNsKDLu6wx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026

Mahua is a derivative of glymur video accelerator with single core.
This series introduces qcom,mahua-iris video driver support.

This series depends on the Glymur Iris enablement series:
https://lore.kernel.org/linux-media/20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com/

In particular, the qcom,glymur-iris compatible and the corresponding
Iris driver is introduced by the prerequisite Glymur series. Therefore,
this Mahua series must be applied on top of the Glymur series.

This series adds support for Mahua by:
 - adding the qcom,mahua-iris devicetree binding
 - adding Mahua Iris platform data for the single-core configuration
 - adding the Mahua devicetree changes required for vcodec0
   clocks, resets, power domains and operating points

The series was tested with the prerequisite Glymur series
(and all glymur series' dependencies rebased) applied locally.

Compliance test for iris_driver device /dev/video16:

Driver Info:
        Driver name      : iris_driver
        Card type        : Iris Decoder
        Bus info         : plat:aa00000.video-codec:dec
        Driver version   : 7.3.0
        Capabilities     : 0x84204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04204000
                Video Memory-to-Memory Multiplanar
                Streaming
                Extended Pix Format
        Detected Stateful Decoder

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video16 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK
        test Composing: OK
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, REQBUFS): OK
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, REQBUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (select, CREATE_BUFS): OK
the input file is smaller than 7077888 bytes
        Video Capture Multiplanar: Captured 465 buffers
        test MMAP (epoll, CREATE_BUFS): OK
        test USERPTR (select): OK (Not Supported)
                warn: ../utils/v4l2-compliance/v4l2-test-buffers.cpp(2223): Cannot test DMABUF, specify --expbuf-device
        test DMABUF (select): OK (Not Supported)

Total for iris_driver device /dev/video16: 55, Succeeded: 55, Failed: 0, Warnings: 1

Fluster test report:

77/135 while testing JVT-AVC_V1 with GStreamer-H.264-V4L2-Gst1.0.JVT-AVC_V1
141/147 tests passed while testing JCT-VC-HEVC_V1 with GStreamer-H.265-V4L2-Gst1.0
234/305 testcases passed while testing VP9-TEST-VECTORS with GStreamer-VP9-V4L2-Gst1.0
200/242 tests passed while tesing AV1-TEST-VECTORS -d GStreamer-AV1-V4L2-Gst1.0

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Changes in v2:
- Use iommu-ranges instead of memory-region (Vishnu)
- Fix dt-bindings (Krzysztof)
- Fix order of patches and iris entry order in mahua.dtsi (Krzysztof)
- Update to maintain alphabetical order (Vishnu & Krzysztof)
- Update cover letter (Krzysztof)
- Rebase onto latest linux-next
- Link to v1: https://lore.kernel.org/r/20261113-mahua_iris_enable-v1-0-b7107e1cbcaa@oss.qualcomm.com

---
Deepa Guthyappa Madivalara (3):
      dt-bindings: media: qcom,mahua-iris: Add Mahua video codec
      media: iris: add mahua platform data and enable qcom,mahua-iris
      arm64: dts: qcom: mahua: add iris video codec node

 .../devicetree/bindings/media/qcom,mahua-iris.yaml | 200 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  67 +++++++
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   1 +
 .../media/platform/qcom/iris/iris_platform_mahua.c |  44 +++++
 .../media/platform/qcom/iris/iris_platform_mahua.h |  14 ++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |  33 ++++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      |  10 ++
 9 files changed, 374 insertions(+)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20261113-mahua_iris_enable-8e3026a4a044
prerequisite-message-id: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
prerequisite-patch-id: c790c17f7113da72001a1b83fa0dc0fb82e22760
prerequisite-patch-id: 5a2f89fdc7312d46f01aeb1507c3d179203c1357
prerequisite-patch-id: 1e1b6daab984b81b7ad83108fb532ea25345638d
prerequisite-patch-id: dc22e163717edf23b847a79af253c6b85bec58dc
prerequisite-patch-id: 2cc01cddaccf18ead1c1e2506f0182193afc1dcf
prerequisite-patch-id: a1e82173cdbb9c315bb6cce35108a7a4057cb235
prerequisite-patch-id: 4ed1c23d97cb438c917ab31f4193c58e3deeecda
prerequisite-patch-id: facfccd32a2f70f2bae3357106a3fe493b4c8c32
prerequisite-patch-id: 59bcb5096aef6258f4732dc8f8789c3e846e16c0

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

