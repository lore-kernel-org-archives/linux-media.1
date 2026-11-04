Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793808705;
	b=0KPdjpdR23WHFYuSZoQ1SHgSx+yyloEJbIlkISk4tHUMrxq2WqXMDWqe7ZuSq96V9qOc
	 ESINaWceVWCFT7+oSbjBTMBLmciVqn5+40BGhkQtpWdsinLDUEZfJgX1hAlK+nV8NvVC4
	 hB2ncv5DISFNECpS8SctLb+h3O9qgcSA8DPl+wcsk0S+1UfDYztqvqSyfDYHZYmB93EZp
	 b6sC6V0RO8adJ8b3FZlg2kpyklSw9YBJe8rUbQmYjf/UsLE0EVBy5O+un/ia5cMn4Zwc6
	 xln2xv+7HX1tAvjJegl7mzO6evfBlwSeA8FN9ZRVHGxD47xfWHLjgWCVnAgAhuCLixA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
	b=FKtq5yvjEdnhUfIT0YdHQhRPPcemR3myOEZe+tJ2atT4apYiu+eVe9f9a4XTus8P/ro9
	 fAp7WbxfLRDrkuqEL8DqS23c0JgkZux//IBELGaQoV+17DOJV+Tj0BW1yA/QgXnl1mIR/
	 lJk8WYym2PjYbGqHN82LDKqDMrVGIuzL0TpoYN2rFvUpm2xOwnVP1HRnIWYvMywSredyj
	 eZrBDLV3Fx8G54XeWU2m6dSN0cbhFH25xjOoiotBYArEgYsw4bggVOJS/JBTDDn4F0cfs
	 caEOVpObkCFVJyNnpaNLIWxxuLsIFeTAq6mWaJovO+n/Sz2HAycUKO0/7JPvme78Rnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HL3zDrgn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=El2IqZXW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DA5606A32D
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 16:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DA5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HL3zDrgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=El2IqZXW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjD3V664822
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 16:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=; b=HL3zDrgnV5oO631M
	Ro3PaT8ie6EQfwqRoHQijSgOKcFDtH4tbxZgzZrLgfk3JSj4kg6r56uj6bnDRrrt
	ScyF0vqH9OisHcxgvpJae0MgpBXydaQLio0ZJVG9j3/TlNXrGtskrkqlmSW+2ZWo
	xU0TdvyezwBVy7vz0pI70oZlvKNb9IC48femR6o7Dqp5cNKgJh905dqPo1w1jdCi
	WDmne/ATT7DGWZMvChAmzLZWil6FP/bqc4iMtzaeY7K30odHjDYn9qZ/etBbN9Ja
	jqK4oYFVlMganJK7VG/lFM6J4I9nVp++FG3byp+UjzBmz/u8Ss3gjnKEAxKIZrTJ
	Koozgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0atsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 16:11:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f568dee56so179178385a.0
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 08:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793808703; cv=none;
        d=google.com; s=arc-20260327;
        b=no+FcqUSNF8DQyp1CF6Cxbrvob6Ah4awdXiQcSbPOvyxfhDarjndrK0LkCiMmsYdDh
         kj3LPa/qq1I9XhT9muAFh0thtW2NSsSjE2qPZwbjeULdcWD8tdidSWBTe0GuE2d7TYE2
         uk4dlP8e4eibqEs9cPJyNP4iiACBqe14hAGu5jsu/m7alwK1cmGHaqa6rDpgsrfm9Z99
         tHPBJzFBtyBqRNBjk+TpmTy+3s9wWBe+d2P5hI2ytWpA2hCPeDI18CHCFntV+BroF7CH
         RmQtVroucvlPk98KFnb9KTkOeO8Q1xVL+e4yz4FZeC1dT3AP52EUhtalO+MFgHHz7FwW
         qN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        fh=LxKnUA3Il6yAtDccs2OpcVAofXMXG3j6dzbnZG7JSo0=;
        b=OQZjWlryloumh11tSRa7Eh9PRB2a7Sx8H5RaGjhKKktLCRbLb/3bk1rr52MDDGiOM5
         PVkXvoeLUhjuoS7VkWiql+FNSUsBV8FH/8rt+zqYKPbuXIjBGJGNfmLOE/qVPrFoWjCj
         IYNRroZsUE4JP3dDR7FnUbKnz3WZ0LfBglJUSKfdL9eq1IzMSZN7HcUPbyG0t2HmAJ2D
         lG+AqI1sqCbJWgQhrGbBnx4YjYhFWueigdyp2E/Km2XLuPlu865XNoL+EoipTXYr+xnJ
         Os4jm8OreSyk+d+Ctips9/Xw80F8+Xi0SoGiYSFenSyJmU1xPIQ5psh6iiExkce+hkMM
         NExQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793808703; x=1794413503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        b=El2IqZXWqkDNC57tidc/K9SGVrfNUsSastdQjvvHqzAaDZRkiyFrAuM/vMIVkTVg+L
         N+iMkAyBUdQ06Itekfz50jEiN2ymXWirP1+05uhuz2Noy5oMOlITxv6gF8NipJ7/010p
         x2uuO1FtQY09ULWm75TENf1JvyJ0Oy0BY8VMzLaHhSwFlY54SIAOMRBzwcNLaaRyoAY+
         T1K9YmEZgQGcaFw4GkFfyOLagtW4i2UvUoItKuXt9F6FUiquX/rzJIPWkSEDN9mRSUNz
         JAhMQSOgwiHhAkSIrVUIa6NkJGSK33AiFXMEyOZYHL+j0vdwo16VgtjOZN16c8sHHvoE
         AJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808703; x=1794413503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        b=yjW5YRyrYGi/zvATMldTcPlI8Vw8qd03EprJk5ISjU8BM5j0eD1Rgao7t9onNXFYPa
         m2KWh6iOfOA+iTqVPFWA/9XzZTlVA7av0TS8SHC10TwtQqjl27bFsAJxyr90kxYQhH8Q
         a81rvu2yrnnLiU7B8DkNQsr3tVmeQBvQ10XDXQedn5KOYzoRwlq2tRWvzvj/u5eWGl3J
         cKbmEsALi8oc6+W9lX0M4GszfNitQFGmP3sfOt9y2EvhzO6krvVxAYKwf+3Epl7cloNq
         nVEDJcXK8XnAwrm4v4I6TFzEVhbXYzNZoJNIrubYFC28ygjOMp7ew02U/YAwDh3f12Vl
         3W2g==
X-Forwarded-Encrypted: i=1; AKwUvBxlqKXpsnqdpZ039ghuOoT3/ZuSl7usITN4eP0i1rpTjQ7EkiuhLN5J4YfqPnz9DEy/y+cN6EHrwiEgQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/GLIszxn8PNVGOZ0hBrdu1wG0KYKEMjoTCWBJarYVLi+BPHCsc
	7Wl9Idop1W+kqdygTyom6x3jkSLgmSk/c4RmaugTKNzTvJa4ymeTiJSowl6eh+jC2PsXjTYxmAS
	NlkIL4J2yTRjxVHl8Pl03VhR4NHpTk+DJHtsjnwHlkyDnDn+Hw6dGAf/srAvl8oVDH9RMugxmUL
	Anlq8Ji3AlZhquQ7S8iI6QJdn+d6d/WZcP8a9NJXjF
X-Gm-Gg: AYBFou3ATb1Mu9ilbb+ukTZy4XAd6FU5T18Nk8yvZmccb0n0LumSCautpP+DaD2jJfz
	e/62xuDRSPV+mEZcJKeq2lO947+/0htwDeRIp/WOWLBPV3FZOorzzuZBSxlNe9tUEhecJPmaM6v
	fcMGnjv8V/sqdyEfYK4Zdsk8hO9cGX12drzVF+hk312L/vYDtDiknsv4AUjdEbEe5ynWnxH7sTA
	71QgxIouDTqvIO6qW2bMgGb2xpSFuRbVdm+MNgfj5F5w7Kq9JsH34hllgrh/yUzsfNpUCvEatHx
	tOo0wSyFzEOeALOs+ygdMgQ7xReW
X-Received: by 2002:a05:620a:8809:b0:93f:34c9:924d with SMTP id af79cd13be357-94421695deamr2551187785a.35.1793808703003;
        Wed, 04 Nov 2026 08:11:43 -0800 (PST)
X-Received: by 2002:a05:620a:8809:b0:93f:34c9:924d with SMTP id
 af79cd13be357-94421695deamr2551182085a.35.1793808702357; Wed, 04 Nov 2026
 08:11:42 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org> <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org> <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
In-Reply-To: <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:11:31 +0100
X-Gm-Features: AclHuK9u3BNMbXNzSA7AiOa-yyai5dEWKspQKV0NGjgXsr23U39BsLgUr6rq0Ow
Message-ID: <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfX9qPiWx4tRQvd
 SLB4Kpu/i24yY581cV7Xx/rP7eBPZpf7ZSdGhcqBj8b/3gjKaLIyMLxLv1dRUizgiY2JP08eaH/
 GKgRXaNWPH6AC4mcW+vGEfMBvXB467w=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb5940 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=rMQDtz2esI8IZeRrkTcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: i-ESGAPMVK87NYEMoaTHoxw-YO1S8kZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfX36214Fo/uybO
 2N6T2oso6WdSBvmvcTbe9ZPW+tDiWEJtkzzu9sZIHRB/G6Yj6MvjSFzV/DaxOA95qlWcdoTQd3i
 WvL+m6VK4pPGtIkeYl/nU4Fi+NDmJ4yw6zHE0ochIo89gkTAcDqCKZNJHPGJl7tIhriKIJw9075
 7cWGQCG6zQLWkGFugqfIMapJoNHUuiXR/pth6xTnnGBW5gHRgWw8UysROZWZHHGVI3PQByJ/82M
 M+z2RQjKrsKU7r5W77ZRZ89oJ1wwToCtw7VKfgi1wI4EcJzt6oTx977N7ZzZJ3NJXP9kUR1HkD+
 1DanqSt1AkCHP714PBi3/HCR3WcmF6z6dCa8OygJFGbvb3ZoHA0VeUSpxktVoXTJFpT1nbib4z2
 AoC7QZxiqQ+SFnTfdNObybaEztmT84d9QSgt9E3igkSlFQA+h0TcpoiUtC3W0nGKfmDb8NZelwc
 EiVcMpgTinmEdDSISkg==
X-Proofpoint-ORIG-GUID: i-ESGAPMVK87NYEMoaTHoxw-YO1S8kZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040064

Hi Bryan, Hangxiang,

On Tue, Nov 3, 2026 at 6:29=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> On 11/2/2026 8:58 PM, Bryan O'Donoghue wrote:
> > On 30/10/2026 15:25, Hangxiang Ma wrote:
> >>> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
> >>>> +static const struct camss_subdev_resources csid_res_hawi[] =3D {
> >>>> +    /* CSID0 */
> >>>> +    {
> >>>> +        .clock =3D { "csid", "csid_csiphy_rx" },
> >>>> +        .clock_rate =3D { { 480000000 },
> >>>> +                { 480000000 } },
> >>>> +        .reg =3D { "csid0" },
> >>>> +        .interrupt =3D { "csid0" },
> >>>> +        .csid =3D {
> >>>> +            .parent_dev_ops =3D &vfe_parent_dev_ops,
> >>>> +            .hw_ops =3D &csid_ops_1190,
> >>>> +            .formats =3D &csid_formats_gen2
> >>>> +        }
> >>>
> >>> This looks strange, why is there only one clock rate ?
> >>>
> >>> ---
> >>> bod
> >> Hi Bryan, the current CAMSS CSID code always selects the first
> >> frequency listed for each clock in the CAMSS resource table.
> >>
> >> In camss-csid.c:
> >>
> >> [...]
> >> } else if (clock->nfreqs) {
> >>          clk_set_rate(clock->clk, clock->freq[0]);
> >> }
> >> [...]
> >>
> >> For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three
> >> clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly,
> >> 200MHz and 300 MHz is not sufficient for the sensor's output pixel
> >> rate, so we need to use the highest rate, 480 MHz, to meet the
> >> bandwidth requirement. Thanks a lot.
> >>
> >> ---
> >> Best Regards,
> >> Hangxiang
> >
> > We have a series from Antans to address this though.
> >
> > We should list the clocks the SoC supports not constrain that list for
> > one specific sensor on a test-case.
> >
> > ---
> > bod
>
> Good to know that Antans has a series addressing this. I agree that we
> should list all the clock rates supported by the SoC rather than
> constraining them for a specific sensor.
>
> One additional concern: if the clock selection logic still always picks
> freq[0], listing a lower rate first could leave CAMSS unable to work
> properly with sensors that need higher bandwidth.
>
> Could you please share the link to the series? I'll rebase the next
> revision on top of it.

I don't think Atanas' series targets the CSID clocks, only the VFE
clocks. Ideally, we should make similar changes for the CSID clocks as
well, but for now they are not being considered here.

Perhaps add a few comments documenting the supported rates and use a
single rate for the time being. Once the CSID clock changes land, we
should be able to revisit and adapt this accordingly?

Regards,
Loic
