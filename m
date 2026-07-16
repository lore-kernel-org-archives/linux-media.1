Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFB93BBFD2
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192201; cv=pass; b=T1JwgrkvXo+Ew0QmdIWSREOglVYL9Fo39EPstZNBfawDJbbNpKnPEJpuW72AHOiD1av+wRJhhFyoFeQhwOUpHI0RShhq5znbU0ORNYkO/1fWHkT2uZR8kUk9WedNkg4UlNGJH8JUS0Et7aFoW/q6Q/R4qmTE6vLQEQ2TN1pqbBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192201; c=relaxed/simple;
	bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YaGeFOCAXFtQBHcQ6lfEeMBSPKWeyBEuqjMBje2MDe8wZ04eoV8EDnPeJIQp5jINLP8EUK+a8KERCOH8A7CFH4Yfp976rFMMtxJ6C6OkCMz7G//yh1olkl3wT88Rym79KecjXWYQviP52+V4GOpW/1cfzgJw/WfSUNw5GtIM54k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6/qtwKV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+1w100m; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6/qtwKV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+1w100m"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7EG0Q2115772
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 08:56:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=; b=S6/qtwKV/SiAF+th
	7VAQiiWcHyBk94yMfL5ag7dWZ1HPNssi/K1bKCbuy4AGVnoMbrHSh3I4Y1iO4GGd
	8CU0NwbA2Iy8C1HSe9riD/CgdmcXWAJFvJY+WSmNgF0z8XButdmM9Bvr8yuIfhgx
	YLH3e2r9gpiDJD3dZSbLrolni1ub9fToFdcyexRyvPBb51zQpsq4sgQhhgAm+nEX
	NqAaT5J6t/m5Hns/2BycD3ZbaHQos59JLzoG6h/YHbMre0kcFaFCqfHOExK0KHXm
	vreHDOjOh92sBZ/S+8BPLIvg6WmzFwD1Bf9xedWUTqT8rCE1ekwpTTmNGaohtkJd
	vRFnSA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1jxjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 08:56:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so84568486d6.1
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 01:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784192194; cv=none;
        d=google.com; s=arc-20260327;
        b=pE9i3L9PyrnVmtAlIXOkyjzuRfBG9IchyWnDW85HsMzhfqQIG8+6AlAWjLaL1y2A/8
         rczBoWo9KHmwGIy+1M6M5lL+H/iXbJu+xWkG80twVPD8v45DjWXoH0pH1HRTp1Pc3X+n
         BEGY17hT4BlUn96tbck2slxp3BeYSbjyeAzBB/6Gc+vr9sXZtUSWx7+pAkaxsKlmIHWu
         udar+vWRKv46W0diGk0YmFN7QOO6S6va3Mw0P/xWnsmFhuQRdi1pV0f5FBNSXqUz6GOB
         GzvVONurO2QSgGyP8OofyeWAoqkvbIfjgD//qnAI5JZfIV1iuWLn2X42hUNcShwxx/9K
         mHQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
        fh=1tI+/6yR5+Hq/DoWtXRDl3jd6kBehvGYkYp0KRKFlfM=;
        b=U1+nYjLwG2XrbAT6iYKynFISW4DqEISihbxJc/9FlezABw/7+rxOETuc2FGJxzDLEv
         s+QHkyLogVhaJbyvw06ffd11v8l0oR3jUCi2v1JXOUTC0NnaxDKgwsHLH6M6QcpP0B4o
         X71TPPZ50tZR6n+W3YVYxphVcQKOE1LkBZVZzOmD4Shytw/6s/BYn1SL9xTLxsHBKLL/
         1XmFOLbNx7yiEnTBHFUkBJsCtCupTyej0I5atosTqRQ8iVUoR2RfUILC3Kc4TzFznJqE
         B+ZQqbLFHsl6h0lTazcNM6uZpNGbHjdZUhQ7L28yMeDSXF+mCzbBCavv7WN/Doiw/C8a
         AolQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192194; x=1784796994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
        b=f+1w100m0fzW7oDt/8U0FFRx5vS87p7xKKN4qjrhm4hgr+YaAob+DAfWFzlXesz0zB
         MBhnDQDM6h8ungvuZoDeJoQD7I/ENfr4Mfv5S9VugvDQ0NLkSiMjud/3o7QNIo4VyzzZ
         zhb4d+JnaLFfXohYFs/Qt6b2ppT7y9KQK9s4s1+b+Oz7Cz3au1RWF6zYNdjxovgqfMvr
         ta4m+0eU50c1CUOxrnc7MhRfLRRrGYUh0CDLcLz/29zE3UUqqQzVAog7g6ihfys4KOkw
         eWk4RSLOoObL1jZQFKO/b8TmgGG1Cl1OKshrFqCJ/Mvw+1eG/BUJkhR1F15xk5JkxRGF
         aNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192194; x=1784796994;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=erxbLLRif2ylk2Ceg+Ib0QqzomEEukkcJoFFt+QTO8Q=;
        b=OiqVlWPC9MCpHh0n923DMUoXPTeKFrQNM5XzvA6sbLPiC6FcWSG5HI8ZqEiRIj/j/R
         ymh1SZvFOUp5xWQ4tNE7jnXVmgeoQsa7QvbC4zH+pndbm8Zsg1Q+YBiLPL3bCATXc9pg
         D4rwcpkvgz0LguxMN6JaDKHya/J0Pl1GDaP3cJ8HsP9E13JiUY6o/omT2oTBZIHPEzfh
         nYFS3ZaiVS41Fj1ADrAAF449QUCsDGQM/OkWaO7EVBBy/3WtWMqG1yw9tBgXN7w2f5Gl
         fjflLIb0+C0SSU8Xsi8Z/wR9ln8xjz0Vw51Bz5cJGK5G7t7EOwpHksVcNhCJOAFL/xzC
         szcg==
X-Forwarded-Encrypted: i=1; AHgh+RqHGqTAcG8G1368rUtuMmq8qTi862kOBce85Y/10LJHVaghzkGcPbTj9fKZ4J3TvM034X4RmcpyhQyOMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1dw/6mjwxpB38qeol8ll6aIId4V1Km3iQc1stmcan0pq72Nwd
	SGSyzGOs4c6dk72EpVsAwEC6u1+ys6uPaAVeRRhFvB3UwdBFO3AEJjvSo6tGA/ad/T6kli0FQMr
	vA36xxUUXmWym4JlvIuxi0ttt9m0nTgt/02EkbTJteDfORgOHb/PqxLI/FhKB3T3ApRl/VfZGbX
	LnLsP6SkhUlUs2BDENkFUj72+SuWKzeMEpmpDUPtIa
X-Gm-Gg: AfdE7ckJyfFSoq1QyDwWhHnnAzG8i0tjoZLaX/TD3NVSKT2e4GhXGjOsWbStMiiV4/S
	6i5q26CtWuvqwhUgyh2ECS57JBpxQZWleVjBksuJ6nntnNyenWjQRjBteFS3UWZr+o+vJw4uZB+
	zZpMz/J5GFZ8vVLkCARI9mCPjNkW613x7RcnHdAfOzqgTSEacpXgNSrBPzQLMSxX4lAgRwS4/2q
	c2OFpHeER77nUiTkS3OxpUmlX0rRMPAyTezN8d0upAn+bRAjzg7tZf5qXhTiHheEgFq16ywQXJF
X-Received: by 2002:a05:6214:1c82:b0:902:e628:90f1 with SMTP id 6a1803df08f44-9074c6e5fa8mr121652596d6.1.1784192193662;
        Thu, 16 Jul 2026 01:56:33 -0700 (PDT)
X-Received: by 2002:a05:6214:1c82:b0:902:e628:90f1 with SMTP id
 6a1803df08f44-9074c6e5fa8mr121652286d6.1.1784192193157; Thu, 16 Jul 2026
 01:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org>
 <20260708-x1e-csi2-phy-v9-1-0210b90c04cf@linaro.org> <YSunV_lNJ8xW_y-Aa2psZavniF6mcHJlJipuj1RYWMB8Zb8yLC-gb7eEnk0XMjfwQOneMGsZM5foFKutCNhYqw==@protonmail.internalid>
 <b7baffda-b97c-4b83-8d9e-e381d0289682@linaro.org> <3ab676ac-919b-4a80-8dd6-71dd7f6fe06c@kernel.org>
 <-iN0mG5nS2joxEn49UrxFlORE3R6Ji3HRebfOMNMGnupMIobTBdRDvnwjRHAXHeLmGf6O4JJENVauduwZXwhiA==@protonmail.internalid>
 <b834e9a0-a61c-4912-b57c-36d571938b75@linaro.org> <4d7a0e59-7c34-4557-a475-8cd7fd2ad2d9@kernel.org>
In-Reply-To: <4d7a0e59-7c34-4557-a475-8cd7fd2ad2d9@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:56:21 +0200
X-Gm-Features: AUfX_my6CyfzbDCMixZ0ybaN2jQ8NmSLcHdbJCbKOIU7FiBcCg8_5mqZ43YRmKw
Message-ID: <CAFEp6-2J0WGF6g0K7s--PxciO+d9MR-SCVnrWJ3u=sgQNwA59A@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfX8/IXeoYxjNRS
 Mz8Ji88ojfJm80CUFn98fGFipL22ykFLpgNAlQQZInYeYNC7PvvUEIgDUnJJkEt4JHnpNcAevYC
 3strHqil4nrgmCv73jnOBcksMjq0WJgL2RQXpJNkBSS3U1KVLMyjaX5C6e8ottUFn79j6Cl3m4k
 BWngvaQDPn6GddH1zZZ2RBuUply4yIAPyNnIgSAaOwoceuNVsGjUFyavQ7GAwWSZURWmd3e6m2q
 NCjUGwDlrbWWcrAmsCJN3JbQ6H90s+wf5Gj6BOitNBkf3FORqPwY8FZ/VD1knRk0o3FnQ8cnqaE
 Q6Ss81+8iRb34SAnC+PpsfF6qrjp3Pow/bqmicI6H/+OHTYJu+Xym0LVygmMTyj+w7bkIzeBiGX
 I4Rxg+ubzwf5WsB8iS2o5iCz/c/SvDBUP6Q1PP0mf6+ZI14+9mXZRzPiVm66NxjCyctMpDHfz4i
 JxOLUE81DdfxRthH0Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MCBTYWx0ZWRfX71KJSRLqpx+S
 ygqrVg8ziVjQQmLrlEZMenF7O6Pv8dK8DaQ2ecp3ofuJcJDX+Zh5eZCX4XTeeLL9u1Dl7XQSbM4
 C8XVvkXkzuptMDGCH5G39K0Bx3kS4EI=
X-Proofpoint-GUID: yivT5R_RfZGBAJe5xN2qaIH6ldYwc0jM
X-Proofpoint-ORIG-GUID: yivT5R_RfZGBAJe5xN2qaIH6ldYwc0jM
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a589cc2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=IjkT-cPiO-FOTv-BaOsA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160090

On Mon, Jul 13, 2026 at 1:18=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 09/07/2026 08:40, Vladimir Zapolskiy wrote:
> >> As explained in the cover letter: I'm following guidance from Rob on t=
hat.
> > Pehaps you've misread a given review comment, because Rob's guidance is
> > to remove 'phy-type' property,
>
> I'll just quote verbatim "Perhaps putting this in phy cells would be
> better because the consumer decides on the mode."
>
> That is not "remove phy-type" - it's "move the mode into the cell". I'm
> shifting this back to the DT schema maintainers since, I take their
> feedback literally, seriously and canonically.
>
> Any of the triumvirate will do, Rob, Krzysztof or Conor.
>
> Absent a different answer from the DT schema guys, v10 ships with the
> consumer deciding the mode as per Rob's original guidance.

On the #phy-cells question, IMO we should drop #phy-cells to 0 and
derive the C-PHY/D-PHY mode from the endpoint bus-type. The operating
mode is really a configuration of the link rather than a hardware
description/limitation of the PHY block itself,and the sensor endpoint
is conventionally where the bus type originates. I guess this costs us
nothing on the driver side today, we only support D-PHY, so the
mode-check just moves into the endpoint parsing we already do in
phy_qcom_mipi_csi2_parse_routing(). It can be a minimal
fwnode_property_read_u32(ep, "bus-type", ...) sanity check and adding
C-PHY later is then a one-line case MEDIA_BUS_TYPE_CSI2_CPHY
with no DT ABI change.

On data-lanes numbering, I don't have a strong opinion here. Keeping
the current 0-based values is defensible, in this driver the value is
used as a physical lane index and it selects the per-lane register
bank (0x200 * n), so 0 maps to physical LN0. In that sense 0-based is
a faithful representation of the physical lane position on the SoC.

Regards,
Loic
