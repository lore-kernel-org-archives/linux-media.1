Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795594821;
	b=LmvudBc2lFvMKtbnwg9Ihu1gq8Z1nytdTjRTiSE5eqWn+O114eQpNMHMnjsTksuzVTng
	 51ukWydopzLGnFePqsvDKhBk3/3vBc5KprHREFmOfGJFVBtDtoBDu9jV4qu5f+QE5Q20j
	 htaRJ9cCD0C3G2Wp6qJovXqMwMtyBYGA5+lOsHU7/xIBF8+gpx0aBEwksCyn+lHJGcaeh
	 sWBpuaXVIBUaQsWSa//megDZprz9ViDdBdIwPL1/5uN+OXkG+8QvK/R8SIA7CDHolwArq
	 6oFVcGbjI2BFpQI5fcrloGN0jyU0mK69qjqwWaW32ySsZY7Sl3j2zoTxoHh04ZlioNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9SCFUcP34G4HPTzeVhTRA14/6Sg/0HZEHD3EpocY7Fs=;
	b=oCqiXAs/2IfyjYgpAhx6V9a2TlQP9YskTfvM53OAgP5r9OkwXUud1hD1vKCKuNrkNkZ0
	 fi1fAW9jErLayrTxhjMUGJw7Gy44WGi54kkDifKYJ+p0v3gQpSplfbPpDxJ8S5E0MwdpS
	 SYD7CDoa0Uqs+rGMS+APj5UgLF00y/0mrDqIjI1qi9z2NWWCc5xc+O2O1JVUsWYstGAmx
	 bJ8FcQRCK2z18dcmR5FSmb4C9qy3vCXhyy/oFgWEKjjeIc/bAWr91UbXErdFHZB+2dZHT
	 zo+h6M04x7snLgcpW9CzTJW4nJxKUJA0T18TCcKNllzeck/9qtmNw+HwgPrNXTjb5yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPk+Ing0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rt82eJr0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864BA606A683
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 864BA606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPk+Ing0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rt82eJr0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69uqm1006364
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9SCFUcP34G4HPTzeVhTRA14/6Sg/0HZEHD3EpocY7Fs=; b=XPk+Ing0LGpXGmsj
	SrqvLiAHuaxlOskwlC1+Q12P6WupG9Nl+w0th5fjp5sYsaNteBZlKAVIvqgIob2a
	fyj8RKtHnwwtmwlj8ZsbBHEJsSQOjJKnXtNU05wsFEBju/E3NkXwylf9yav1m0Z5
	bT6QjvKQ9fJeFe71fFj9n9J+rVyVfLxrP7lPy8Sm8H9DrEMwBWc/icnrfNW6wSvx
	Q4dxKio2UJrbiC7daea8C0suhmeU3Uf3N/ZucjVoBKT/V93rr0fN7cVkQPDi2AHf
	pKi4dONOw8RrqJ8vh/DgsjCDEz8osc5tVKe7ogdB7P9F8j/5tIx3s+4Ak0lC4Tzk
	97eaKg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa294mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:20:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso964300785a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:20:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795594819; cv=none;
        d=google.com; s=arc-20260327;
        b=CCxVzgdMQb/6AsHkqfNn0Fl59IBnhMUUoFYik6DVlVCywutc67rl5l0WqaBTouuTqB
         P4KpP6btBP7yW2s3Hxe7OQTvCYbrp8cyL9MGbjiK16vSEqiJ1HU72KJFsgyqLrtltBOH
         d9k6J1Esby/iVTbKMIYpnWNkZjl94uBlEwJXZdr2EEYa0nYrZab2xUlXMzn0ATX/VK1v
         2z6fFPyYNoG/CMI7busAJ4lKEDIdHv7071kAvZMYFMgMdUdZAPEDzuL12SLtW/QTJVse
         MqFI03iGtUy9uN06VRZXo86MxJLTKGvli/6/ZlFIOYZWFLnEbhR1ZWyl6p9z0JtJRcpA
         Ms+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9SCFUcP34G4HPTzeVhTRA14/6Sg/0HZEHD3EpocY7Fs=;
        fh=fOuhiPTvfYoZ0FpqAJHLAVQ3hZ9FL5MmcJYOI0OkOIc=;
        b=c+XveU9ri5rgdRoUWx5JIqf1d7lo5l/sXj/8iBycEyf+xzOnwGLrn+A9SToQUwG3VX
         /nczeaQHoyquS2QqYZYvfyg9bsj7tAUTWV3HxP6cWxTOzKvE9CsXjLBjqtcvvAadt4CM
         iTc23IWzl76wRtepWmcGzje3y+oEypCcuI/OF7haOnp1sgN0nNA+Ue1a5xcncjuyS72B
         DRFCT7e6oot9562951fIof8icr0xyVrRJxuzsCzJ+n1f/cFt0CXhL2N85sYUIekhvwlT
         61N+3Wgns7zFF+trtL5aNXdPPfapEROab9UqxpG9zW5ghzdkeZ0q2H+PHHmRT1mUG96H
         LpEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594819; x=1796199619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9SCFUcP34G4HPTzeVhTRA14/6Sg/0HZEHD3EpocY7Fs=;
        b=Rt82eJr0iU6Qdw+D9EcuRSOs3n91Y0jrS9KRb640DTdNBYkdGerptwZHcEql3oHOtL
         rhso7zAhHud/396yvhCluWXkDmBEpRYX6kHZyCvJ9j5NwiMEYrFKJZCts+AatMBg4Lvo
         sBdAS5D+lYT8howCXwvlaq6HGCo03LIHrXtxeEOgwwZNHI3QDMnQTP84yRphoJBVJV6F
         qIMQdS8ANQfdq6ZbqYze3N/NiRojXKX63FhY8Sb+ys6XTgreVoO7TZ1CtwX2kOXA9YiU
         Jy0TVmjRGh98p4G6cQIz5NPKUAjb10iFMUfiMjqXTP+s7WqhZ3VionpI9eSlCW7Y9ADU
         kRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594819; x=1796199619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SCFUcP34G4HPTzeVhTRA14/6Sg/0HZEHD3EpocY7Fs=;
        b=fRih2/8am4o9TQ1omn6x1ZY1udd77eEPiqedBTtVDZJOJ4bHZ7pblVBPnvteauIEie
         oDr1pzL4IDl85nnFm0Jlcq5n3MeMWpVtkBwFMnxd6rQXk9GHdSr3Kjxwr+tKHvY19i6t
         ScKVOtyzAr7+q/v8FMA+YvYFeCHyU6EEm8kZB3UHetmht6BOfTN5B3CTSPAkfKM1SjoY
         BVUiKzVqRHmRQRMkEcurKn1uaelFhMfqSdDrjiOZsGrWqH74QhyI8RYPij/FY50dYGAO
         F0t5LXGs4/8JJnPZ1OLUp9t3Bs3OufqKQcsNq8lNLLaJJvk5xlHcLNAJ/pAPkuzox73Z
         mj+Q==
X-Forwarded-Encrypted: i=1; AL+hErH4N9XGs575WGXtquZBThzF8mgTgvf7FSjVA1mEMKtfloje4cAr4niohiNqYqCAHgLMLxDpp/Nzwb0WbQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z++o+kLUYZwfsUXWCW0ZC+UIe65r72XrawagrHytsyiC+z8vPFu
	H6BPMH5s8Ppj0aiGy+izAZUWqUxBMJJDzYcTE1h80tELAOmCl9I2VjY9XfyB10dD3qSSKS/vJPX
	cp+imyEfEEplNCmr60OjvRo0Zyd0PzZvcK1EMoQRo8ko9hMUtyzRQpwXRGzJrEq8dx4DOyWP74D
	+7AdwXQnFVN6MrkSQyeL+wm7bfVWXF2zWtJC0715dV
X-Gm-Gg: AZFdTZdUK9ErDUzhCgY5kfX1OJC2PFMWzefzMa9re3BLNhnD64amEvGuPr1le/+keek
	vTQ91iobheDeCiW/P8I5DCk8P1p9smpPi5FKGw77DrwnfImcd1esl13e39ELns5ozEE6biKtyjU
	xxoXOlL+qhcS1GMEYzb91NHIOMA9Fmz3I/ighc4t76KKogtRZJPGxqK4P9Dn+4LBZfz4PRwMAOq
	+hmy/etK0m2/ZXSrF58GvJOtedJmGnJuvYE+IhntORrRkXqhbyPzJnoUbHTLDXxdfBizz2gr/U=
X-Received: by 2002:a05:620a:3914:b0:949:673f:72c1 with SMTP id af79cd13be357-949bac9c6e7mr2425277385a.83.1795594818674;
        Wed, 25 Nov 2026 00:20:18 -0800 (PST)
X-Received: by 2002:a05:620a:3914:b0:949:673f:72c1 with SMTP id
 af79cd13be357-949bac9c6e7mr2425264485a.83.1795594815810; Wed, 25 Nov 2026
 00:20:15 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
 <20261124-tfe-fix-irq-v1-1-fd9840d952ae@oss.qualcomm.com> <41204b50-d861-435c-9cbb-8155e5e1d771@linaro.org>
In-Reply-To: <41204b50-d861-435c-9cbb-8155e5e1d771@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 09:20:04 +0100
X-Gm-Features: Aa3M54pwTvkfIe-W3xNrwvsMb_zCkwbrzBCxL0-Sy9LRsk7i40hR7jCMjKFN7w4
Message-ID: <CAFEp6-1vSybYx6QK2pq13mbuM-eJhto3UxhsttvshmqNN7BXvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: qcom: camss: Latch buffer addresses through a
 single helper
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: vvNHxzdfP95Vu3xjW4z--kJyp1Mb-QmE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfXzh1Xbc/JmF3+
 Gf2SOZ9XsVHtH59hHvTM2/OfoJbQmBsjhZRLSD+/7bQg9jJfqLa/LAGRtZuZ/V8/r3qf8O9L1vp
 3jaEM21376x/spDS6kNGY6fE77K5tKw=
X-Proofpoint-GUID: vvNHxzdfP95Vu3xjW4z--kJyp1Mb-QmE
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b069a43 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Seq3w46qzr7p4GGkWVwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMiBTYWx0ZWRfX79EAYWEpiVC4
 TVRrzS1fE7mbNO88FV4UB0EbMLAR+ElEguszF1UfxBDFiWWCE8dgUZLWLBbu3ckuBQ84FtH/FLY
 hMqFemSngBGkIRrfCE/g88y753g1H9hrVMhTULqOC5w6X5IuQjornOczy+ftLd+K2DQDRvrdTrE
 KXwUjKecbbYrZKDnbFf4HIs99gZxsXRqwj25mMIfrDaN6T5521nvQkdJ34Z/b3DCjxHKAIayOpw
 nrVMpLSnZ3eq8wP2pRgQ35+xHU3gZQz8Isq357gyWypGhpFSeUZc1Uvhvv3wk4orB+Y6PhKpbO+
 ql5hhVrLuz3qPajTOuq1223NsB6vXyEwslIPlG+cqh402mxPZnO1x7oQbj79TYLYFY+XVmrstX6
 aLkWScQt/2lA0wodQdjfwqsSjaqVZF1q3GKqbCK1jYaki/Gyr/NBt555DyqEIF949FOn8GTE1ld
 E8O0myGN3VfzyUyicLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250032

On Tue, Nov 24, 2026 at 6:33=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 24/11/2026 16:47, Loic Poulain wrote:
> > The buffer address written by vfe_wm_update() has to be made visible to
> > the hardware, and the way to do that depends on the generation, the old=
er
> > ones only expose a register update, some relies on a FIFO, while the ne=
wer
> > ones expose a dedicated address update that triggers the latch on its o=
wn.
> >
> > Both sequences are open-coded at every call site today, with the addres=
s
> > update being additive and always followed by a register update. This
> > leaves no way for a generation to tell that an address update alone is
> > enough, or that no latching is needed at all.
> >
> > Add vfe_buf_addr_latch(), which calls the generation's addr_update() wh=
en
> > it provides one and falls back to reg_update() otherwise.
> >
> > The write master configuration programmed by vfe_wm_start() still needs
> > committing, so vfe_enable_output_v2() now latches each initial buffer
> > address inside the loop and issues a single register update afterwards.
> >
> > Signed-off-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
> This is a bit too wordy for me.
>
> Can you reduce this down to one paragraph. It seems like a
> straightforward functional decomposition to me.

Sure.

>
> ---
> bod
