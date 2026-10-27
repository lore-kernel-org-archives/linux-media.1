Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793075217;
	b=PX4Ol8/06XoVISzFtALGF/Fm0bC0HC882XI98dQXV+VJv+o0ny55PE8IzTjKuVAnHvyr
	 DvvgHiHIJTB7ecxt8XhbqwzSkkZtgR61K0F5hoshWI6hJ69/pjJqYCadj92mxpBzxd4zY
	 H4IMhB41faQdc1o3OH435pK3h8hO3BdhWSr5IvH1+fVWbaVBduruwHCff+EtBE9ARa9Ww
	 YqPrs5TBNxrZHjZttY5EO22c+n8oAfociUv9KmOfUHxpE99Cj5BESwVRz1wqQ0/rit9aO
	 Za5K4SP9OfbcboPuAVd6VYIdYd7DCx6EfnADAFr1lp1sUsiTKiVvxulKftm2ZO04OtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
	b=BOSIliV34MnAR20JxJDsoM/5X+79uN7NAUWeJZOjXUlXN7cYgJILSrfk09MXHos8UFD7
	 swXlALUWuCSFCpyo4N9Ync2lq1SBwJEBhOQIuHkb8/OCQq/LVKRCLE4nemyRTVuPZEPTf
	 zoeQZMTDLX0ZvZmYtql2AvYdmOnK5rKASA9p8X/KVTpOVPfuCwXNjIz9cHcTaY0dgEVhW
	 Sb3iZUM9UMHNe24XTAG3ZfoueIU16mRPAq4beJdZWtoik14GvFTnCU9E8hZ2ji1U3sWSP
	 VXiXCehXSuE6Aq4FvhqnAJgSXAQW5CCJt0cTFK65jtADT31B4YH4sy7TZesKmWh+CYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWdUgzXB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JguEorj1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDD3606A31D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BDD3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWdUgzXB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JguEorj1
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2F3n43987000
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=; b=iWdUgzXBcnZtNJQ5
	49eWB9KnM2mby/Ra9xncGXEAhRUpjwiKpTbXVN4ctA+nP7FNDaTqVB+Np5I/2CRQ
	WWmtcC6JYZ6lSc1VeGB05ZZFQA4VkLoB4E8ZEbbIUUw+49EJbKMo8+ZB88dOHZap
	m6xyC8m6Q30X7Ped2XD0S4+UChoAp8KswWK7hoPtMOxhghr29dJGOUxW8hcQ4XPO
	KD7LerWeTdCw/0OYr0TUELNPzPhJiNUDBR4QqQkMuHpKSAkgIXyF2HGNlj9TCb7z
	ra+MPyL9MOAnO+uz5QRgmWS0rYMtw+qj/2W30vw0J7el0k1I2ntiZ0vLATHtkOdw
	Q2XysQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj8smtqar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 04:26:50 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e96da6516bso3919330e0c.1
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 21:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793075210; cv=none;
        d=google.com; s=arc-20260327;
        b=kdm7scMn19M+PrnXtFNxwf/Rur91xbH/JNoODdzmAMWSwxv9ejpmTyIzWR7oxGmGrM
         kv85QCOq8Mjq6DU1Rbpl2iEEmkvL7Pr3fqqzV/5gny+nc25mgPsjLsvCM9gDIRCv2c0M
         9Slr8aXvhZ0XmI2X1UX1h+adXrgB7dterArJtXwpQ89RyUcZok20VgAnTQNuqNKYF9nK
         Za1fT+3C6EVfqTjcG6K5SpbJ63wym9Bth9T/PIdZs82qY9N3J3BP72tIEsSK+FIvkkvM
         EusAAicdTCA8foa5HA0T6VLYkGLyDoCXTZOLsXtoZUF+v0oeTBEDMuyOJ/56z0nWr0hV
         MYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        fh=4Ht5X3XNq2zonns8GyZcEhno/jRVC3ZPv6IPPCgE6oo=;
        b=s6R9E18ti0Yyc6VUrEnHKEs93usvVlZWxgoT0uLSJPr46JU1hUlLjltRF1SZnE+tBT
         Fl+S3IjIdRQJsizQyPDxiB4FVijlZMc5ixorK5ItAizhyl/Yago5caH/UinxIBy6dmWk
         nV9AKQqZ+0Ez6GfmAY+BVXz5yVDUixC5iAUm0b6GqhEdF6uvRAS+ZR4YeBTGB/pKiFQY
         aCpZ4wGgyv+J91A1a2mxdzoH6SRDgvSMcpWI2CP4F5BiCEmSHJ5zAeQuqpjTVzZkHPfz
         TviAHB3KQK82jR3PyAXZAe8Yigv93lu99ZGtxpigxSdvirBD6FJ7yYmr0znOaxCCeuVB
         1iYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793075210; x=1793680010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        b=JguEorj1DYC0ZHzRjcu+h6eEsL20UXSswiEk/FQVzneSKbaiVmZ606RHkmkMr6HQkh
         xB67AKdZF7NaksJsaGwpF2ynbE7m7sfrtER0yPAhyWwUyJHNnha7wk55m1DaTqIqBLB3
         ewmGD0O01E+6Lk9MiMtIc/x45erEfkogNGM4gMgoEdqfL4taCm2tBv34NuLuNWeDwHma
         hNL41R4a1zG0XMhD4CkinKU238yCx27ff3TFWvLFtfrcrkVwE8f4O8vtQP5AeQXSuCWE
         /fr0j47R1hnVyD0KaIWCVJmPSCR08uxyiIEfgZnprlO9P2KwCsNPH8Am1pOSAD/hP6Yo
         ryBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075210; x=1793680010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        b=IMx/cBaD+ScR1GC/eXBi5BpmsD7NgvZXnSa/3pF/pJrsT42kjraFf9a2nhFTyy7nbm
         lG5HzwIFVpP2jQpi39e/Iqii4Ii8Smi2cct1RVrc5p5K95uyAk1Jal8SwRt18UUOS28H
         u8JifpX8WejDoJGUk+yLUhE9sG67HzL2UwldQ0T+NE0wjZh8cHB/mxgnDSM9vsONK1nE
         I/Ca0rhSrgJ/OX1kXpCzJ0BtKz74iwOwVrLf5m8yPMxSPImwHVDXNRXDU1GUJMzKpf2D
         RXcBBA8+ubHM/subyf80Ju00k6dkTZBzDOktax4ApWc/FyRcGlzgC4WaT/Em0bq76CwZ
         myWA==
X-Forwarded-Encrypted: i=1; AKwUvBx4C8urTNgZAzPuXMB6WERCt3hXLQ+s/g95TV0bTaO+1QL3ttRGxt9uU9VEoKjlK+Ak8JpzeRxb30ewsQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGOwX1jwWXsmLIRVtqrQSdQ9mZBZXzf0FBkPDO4b/vgADyEsb2
	OjmuoTwOsXIg+60Hn1vc0QYeVAMclShQaFMaqHQ+YYch8FoXAPpy+HQFKPMLuJB8omH1uyyH/SK
	b8mHbSlVT+UTmYImV6LSSQKi/qavIXcIcw0BCNCSdh03bxByK4Po70Fne+2vJISDxkDSucpbLYG
	fdAKhpyMisrx/xKen7MyJ41JmWie86TIzlRFU5BT9U
X-Gm-Gg: AYBFou1acocoZO6JvKrRNzqUVPnf6BxNtVGTuugQOfCbC98sp2ksTw29u/dQq2YxGF+
	LHs6eXknTfIIymtD/ISS/L6GuKaabD0EItHPDoLCh+0ISnr16twYMTwsyoijDyxErT7v84LWw8U
	KzxdvCEp0V+AWa0C8I4iIax9+cxYP1rh0HqMmePzCEaae3IZ6U81oT92cqnWhY/EvbVX6Spl1DB
	LEcjM7RiZMQKnkyug==
X-Received: by 2002:a05:6122:d1c:b0:5ec:a9e:d80f with SMTP id 71dfb90a1353d-5ec2323eb13mr3595421e0c.8.1793075209746;
        Mon, 26 Oct 2026 21:26:49 -0700 (PDT)
X-Received: by 2002:a05:6122:d1c:b0:5ec:a9e:d80f with SMTP id
 71dfb90a1353d-5ec2323eb13mr3595406e0c.8.1793075209303; Mon, 26 Oct 2026
 21:26:49 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-11-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-0b0+daADC6odCCgxgsBYEV6ZJx1eDUNHG=Vi60cA3ZFQ@mail.gmail.com>
In-Reply-To: <CAFEp6-0b0+daADC6odCCgxgsBYEV6ZJx1eDUNHG=Vi60cA3ZFQ@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:26:37 +0800
X-Gm-Features: AclHuK8va6xRV24M9rgTF_POC6JkORw-Ok48zk8PcpaxNQ1oNylaL8QpCWYsZNM
Message-ID: <CACbMrhpYMs6CvAUzJbZDd4+JkpsUSoJaXHcF-A7a0wNoZQDhgQ@mail.gmail.com>
Subject: Re: [PATCH v22 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: u2COqeoeNRVmqOIq6z_ecb2hRpaRg5i7
X-Authority-Analysis: v=2.4 cv=Sfti5fRu c=1 sm=1 tr=0 ts=6ae0280a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=6iLt9ATBiMRDfCnMGdoA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: u2COqeoeNRVmqOIq6z_ecb2hRpaRg5i7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxNyBTYWx0ZWRfX1c47WVvb/HbJ
 8ZDHiqycepftYZl8oopFMJWjc4M6PjwSJpVqJMB5h9wcnFLkxAlf+QSvfJyOuJEcKL/vbnj+g1m
 Dr+StEDRP5vhx0pBUVm1GNzD/NyMUCA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNyBTYWx0ZWRfX9RpHEvNuTT2O
 VlVHyUgMqnhv+U6/A5cuUHLgEX9qlLsqQPiIpj+lvO0/8DupURM497CpJVP8bLlUlor/m53jkFm
 dJktotE4vj39PbSosc5ttkuZXn0rEpG+m+5y5iDpeJQPKTH+bdEyNQHkKRzFCCZe8/6zmFsrjBC
 4ZjsQAWjnI3RHW17/OyHZ608UUv/cj+gvmTt3SKTx1F91muuDaET3wtpDypParZx/yP2K87Kx2t
 VGf9ETQ25+FSa1SLdVAqujRvhNvwR81E+q+5XZtY44JwQcPOLccYZAo2VnJDNuSKefmBIdUZB1X
 WA2rz3Kz0u0utMUjpjMMLI9L4dfJDtZwFyAaJ4lSERkW1RymjgIRL/qY6EyPDeYvEPK1yY3VmD7
 BC3aIIdCej4l4cXOUDemdUBrIFOZNUnlK9bZc5MGWXEmmoVckNtUKwqP3qJnbllJwnuF1LgQnKL
 yuQXDSCXywIl01U+kfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270017

On 10/27/2026 12:29 AM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelin=
es
>> can be enabled by board device trees.
>>
[...]
>> +               camss: isp@9253000 {
>> +                       compatible =3D "qcom,kaanapali-camss";
>> +
>> +                       reg =3D <0x0 0x09253000 0x0 0x5e80>,
>> +                             <0x0 0x09263000 0x0 0x5e80>,
>> +                             <0x0 0x09273000 0x0 0x5e80>,
>> +                             <0x0 0x092d3000 0x0 0x3880>,
>> +                             <0x0 0x092e7000 0x0 0x3880>,
>> +                             <0x0 0x093fd000 0x0 0x400>,
>> +                             <0x0 0x093fe000 0x0 0x400>,
>> +                             <0x0 0x093ff000 0x0 0x400>,
>> +                             <0x0 0x09151000 0x0 0x20000>,
>> +                             <0x0 0x09171000 0x0 0x20000>,
>> +                             <0x0 0x09191000 0x0 0x20000>,
>> +                             <0x0 0x092dc000 0x0 0x1300>,
>> +                             <0x0 0x092f0000 0x0 0x1300>;
>> +                       reg-names =3D "csid0",
>> +                                   "csid1",
>> +                                   "csid2",
>> +                                   "csid_lite0",
>> +                                   "csid_lite1",
>> +                                   "csitpg0",
>> +                                   "csitpg1",
>> +                                   "csitpg2",
>> +                                   "vfe0",
>> +                                   "vfe1",
>> +                                   "vfe2",
>> +                                   "vfe_lite0",
>> +                                   "vfe_lite1";
>
> I think we should probably start adding the CAMSS "top" register
> region as well, to provide a more complete description of the CAMSS
> hardware block. This register space contains, among other things, the
> CAMSS hardware version information.
>

Ack. I double-checked and found that Agatti, Shikra, and QCM2290 have
already followed this newly introduced register layout. I'll update both
the binding and DTSI accordingly in the next revision.

---
Best Regards,
Hangxiang
