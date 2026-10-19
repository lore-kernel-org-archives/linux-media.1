Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFFE4FFA55
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419342; cv=pass; b=hA6JpkFpjPP86JDGVn6AYm/nFY/vJW8geQHkSk9h/ekKvKJbEIUY3XgzJuNYACzO8NmXcFhF9wzuW0IBywDGoQ3nuYYb+OcyZ7JW2GEJoc54GQja0YZImHJ/tSZOEKF8sjJxc0JabMZFT92+GlECwwM0hJvAnpJK47iL5MShhVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419342; c=relaxed/simple;
	bh=OZk21wfXZRb7SIDR9x4MPB+G+WpmzJI04w5Z9bPa0Qg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YIH/SIDM33EB0K+AbJ4oEaWp91RPTEW5S9xNRdjcVpU3FtzNjPbDsDv0d7nrVMh/IkQX6LR/LYyTtP5Bn5LiyGi+g6ZghjfVm6qs1k5I5cjUAyqM0TJ8+mFKrOC3PXqTHSpRNwvbM9ILrUFL8z+pPYHXv6YJI9WMdfvDUt6poIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcEJ/oB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/X6uLqq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcEJ/oB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U/X6uLqq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Z0K2774590
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=; b=kcEJ/oB5oTstvwiv
	SlGT7Go330EToKGIy7e2UHwpCIVOpN55wwnmY9TFSWLa09HS/erB0KhN6hCPCVj1
	cURKKeX/9+hsAt82MZ7pY3CmmYl5RDUyrSOevuugQB6JbiiJMxECZHYMrR8TDIij
	un6x6dGUDV7jvYqD/o5u4s3jobV/shLnGP1KH5vJSRa9/lYhzwxPbrExgbdIqpQO
	INERChVCaSzDCI3aT7LFVyd3gUzAxPuSflofBkSn3hDD1S3Ux+U+Avc1hq/8SK0s
	UGXESGCbdryJM22teE40GCtLLDVnaahHpQkt0rSJNbnP7Rsnw/WOwFKISs1ceMog
	4vqXOA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur3694-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:15:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca9b53afaso755698485a.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792419339; cv=none;
        d=google.com; s=arc-20260327;
        b=j1+8nmO3WPAcafUo79mzSSdIRGiw8YBbKAj14tfCAk1B7BskiWnqYAUcyIvvV6WR0X
         ERGLCeeL+UTjGWq54oQt44xsIPYWSIRiI0xVOfx6xe5TA7Z4K5gD3mAeC+VWcH8v6iYu
         nJzk4OO2UEQGV3VPhfVpcxXMaD6cnN+USiX+q+Z50H51GwGjwSNFHYzLW27FVUUWoW2l
         BF/RWEM1o4DgjDcuVgljV8/bgck93nd49sEVp198yjb+33T8AI/kHApYN02icu5MKZRh
         eNiiA+JaAkUOwxnd0xkEWNt/uLqUcwH5qt8zKd7MhCq5gKIaKHcC0ipiEbvBD9qHuQWk
         IXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=;
        fh=1D6cBRXakjyRuE+huwrCf6ZdcaSDB7GTjWj3eIbAC2c=;
        b=H2ULhpYaK6OkCKDoQeecI4CxEtxuojgj3UO5KUB+WCDcjwWWgKt8Dn9uX6EhlxjkFu
         Nb3wpipzakZPoHuW6DWVMz9rDV5WFxtuybV4G2EE+ERCojVNLPCMtQ+isyq/qbQMzOQm
         3EZ/CmQYXQQHIRtQWUGgis62QETWLQLuGTZ5ra1JJQOwDWiCkcqxd5gptMUto3l10knF
         SJF53jHn6NLGc3acFcuOpDMukoyL3HXlpZyGE3mbSrGb8SZgq9Inlc1y7eP4gZLGY8Rj
         7O1HbccLRmtndVazMVlaKYyVcZGV9lHrV4oJZkSITKWjnBR1VdR6TNQW7hzeuNBxTLD5
         JFpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419339; x=1793024139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=;
        b=U/X6uLqqg7w/83VNclm6anqqunXmMSr/m4XM/BjgFWFLCWB7fDDpX8ZN2jCm1h9JaH
         DcIXo9k+sAqDhG9VyWndmNjj15lG4oLNAnL+UllgeVbPtbzIHQ4EoiG2dMCvZ9UkvRKu
         ULPPHn7OID6rGjdAzVVjAu6AJNV1CDharsAHOr453XLjqW+qdpdjIOGDwUEZxE7TRI0N
         mPZrOgoEIEOVxNGUMkIvxcHTR4+YA+xhiLCqp9Td8VDz/SODl1Mug2canvFXVTM9kadL
         oTsOcXaXjb0z2kt6HM1l3QPLrhnLLOnAZVXckk5VqDTEkTExym1kiAHVv1wfEILpK56j
         Tyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419339; x=1793024139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGxGGeQlAinO2GjMk2zylyAL4fsr1v9Qeko4QAXo3VI=;
        b=JGK+sWgTN9hzk8kqYPUPp7yry6VSLxOG77Uk8EaOYMf7pGqb/DgjVqVVwuWZ0snR1Y
         h71QtLGeMW/uOZ3zRVLFydSZ8kdjk+zTWZ/mT8vQ8HIaGOkHDRXAmhjtxfEVMJz5e83Q
         S7E/Uh8Dq7MYlewqLDE8247x0alaePN08EaWagp2f2jLhkvNtVZVU6LAPn0taK5tLcNu
         v4BHQz/6B1OdOukLAplq7sAiVoD826W7b7loCrPzBWlf3DLZHPSTIW/emLw/uqDhUVT1
         B/VBNeOvFBRhO8n32RZJBJhvi/45SGF798XqJv+mqhKIEvtWtr+zzE2qD/Sk9Xmct1mY
         PvlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwsg9ysWOx37Eun0LFalg1u5ZkV3rPvAInRwI4Hnu9vc6m3ApDkDbmsP8FXkzU6DB5iHtixZHUdPfh7A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLyivFIgZCg6Vwh2hoE+Wpbo+/TNG3DPxvGCt3OHNBP3dwbhAW/
	EaEPaIQxAAbTF+AluHsVu2HQWo4oJgnVSp3yKg1Ypl1SC292uaVAcH7WEEP49aR6Br2vA4aOPSi
	cFijJiIC+xku1lsjuWZbMK9kEyE6sKr/WG+fuH4/HfHxN69+Almuwep0LA5eo+Y/5Cto7ZRhWg6
	hp54R3oKHbNIE7ZhuigUywEa61klFrdv1t1YlwIG19
X-Gm-Gg: AYBFou0a3PpbCJwh5UrByVh4hPgPqdI0Xv32LCTpbLNKGf8kSgKkVYZFxz/X4cKuEM1
	ffuRKXKeXKMBuNToxdIt6eIOcvfahSP9rt9UTXuxKO83bKX4OjO85WxrzfU2SCpCmwXAU1Vt7+I
	apjCckt9CzakxURhDfBDAemhh+ayvOCPBR0R1iTunOkL97vSDZik9/7CATxmShMuVR9HH5snouI
	ya+dDQm2tK4NmtSt0J16H8hGobuuG4ohpdMzXqI/WydAEVni4EMXJ8DvSVQnbYBIrkYABjn2zo=
X-Received: by 2002:a05:620a:44d5:b0:93b:d79f:d941 with SMTP id af79cd13be357-93f29d8c957mr1279601385a.54.1792419338442;
        Mon, 19 Oct 2026 07:15:38 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93b:d79f:d941 with SMTP id
 af79cd13be357-93f29d8c957mr1279592985a.54.1792419337892; Mon, 19 Oct 2026
 07:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com> <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <xGBkVr2J5eTHzEO_i4LTjdWGRO1MXGiIijMf1PGUbQ2gEYqffgMDMtx4uiNyBldbbiW13zmcxMWZYYjJ1s--Vw==@protonmail.internalid>
 <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org> <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
In-Reply-To: <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:15:26 +0200
X-Gm-Features: AclHuK-VWW--gliXBfRDzVsTxK47hAbaeQbbFKbhiFsjaFEx70drXgk7IdDdHpM
Message-ID: <CAFEp6-2f7dzz2rrNuTE=4VXgkM55qvYY1SANcZE_8TutkJ+SAw@mail.gmail.com>
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        gjorgji.rosikopulos@oss.qualcomm.com, jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfXwWHqrLLzyrF1
 vA8VwpJK2KYyFga9Pl1MoFxxGHfxPm+65dtv+Qr4q1rJMAgshsKoGx0fyK5e0NH5ahVgVuLVxWi
 SBhiRXa0drk0vLyUUwlwm1DJUpXNZIs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX8ms9XVCyNdf8
 JT1yfLuWgODRxlOMUMj/iV8PvH9N+vn0dglcg+4xVyOdQ1+Ey3QqOFCwdggHd8VgLmQp+CYTTFG
 GY2z+XkUh5L/GZ5kfvaV8NimYuJrKm+DnKGM5b8Hm5IphSImIvafu6GaMrrXZsy1UFDoMr7OVYw
 sq6OxQxZW9uGShmLZrL2GbIalZkSg8ycdfhLdv9kZAxTaJa9MLuy0SPUlRqerbPJm8QQ8x3Z1TC
 Gt4J6mDGJPR2XGDURfvXL05DGRgWCUrgP/P7dSf6my24GnG81xXvu1pDW5vJMecK+PrceWOi1/R
 cZMkPplkK1PoHsvjIDS0zfp2YvFuv+6LWskPhyliGm/kaCsXzuBTNfJbLRCpKf1Pyl1sJT34Tq6
 rnJeAtmpqYuviObHl6mUsegBQhuGoHCHQHSdNRyELyrVCIQFdaJVemSPEbqXGO6UDG8aIo9JBsI
 qifBkyzmC3NyR3HnW/A==
X-Proofpoint-ORIG-GUID: byNU_3MbDgE-5xLfOMRYKl9XSHyb1mLo
X-Proofpoint-GUID: byNU_3MbDgE-5xLfOMRYKl9XSHyb1mLo
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad6260b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=x0i7aQ4OanKIX9y7GswA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056

On Mon, Oct 19, 2026 at 1:24=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 19/10/2026 11:24, Bryan O'Donoghue wrote:
> > On 18/10/2026 00:00, Bryan O'Donoghue wrote:
> >>> +    unsigned int        lanes;
> >>
> >> This statement and how you go about using the data aren't consistent.
> >
> > Re-reading this.
> >
> > unsigned int trios; would be fine too =3D> data_lanes and lane_polariti=
es
> > is a multiple of trios - always three - does it imply that the first
> > three entries in data-lanes =3D=3D the first trio ?
> >
> > Presumably.
> >
> > That would work too.
> >
> > data-lanes =3D <4 5 6 1 2 3>;
> >
> > =3D>
> >
> > trios =3D 2
> >
> > =3D>
> >
> > data_lanes[4, 5, 6, 1, 2, 3];
> >
> > trio[0]:lanes =3D=3D [4, 5, 6];
> > trio[1]:lanes =3D=3D [1, 2, 3];
> >
> > Probably "trios" instead of "lanes" makes more sense here and the drive=
r
> > just always validates that count(data_lanes) % 3 is always false.
> >
> > ---
> > bod
>
> I'm going to argue with myself.
>
> data-lanes =3D <1>
>
> =3D>
>
> lanes =3D 1; // not trios no need to introduce a new term

I earlier recommended using "trios" in the other C-PHY series to be
more accurate and emphasize the distinction from D-PHY's (two-wire
lanes), and because it is the terminology commonly used in the C-PHY
specification. That said, I'm fine with either term, but yes, we
should be consistent and avoid mixing "lanes" and "trios" within the
same structure.

>
> =3D>
>
> three pads on the Soc
>
> =3D>
>
> The question is - is data_lanes required for the CPHY opts struct ? For
> the qcom CAMSS case the answer ~ always no - we will be attaching a
> sensor and will read-back the positions from that endpoint.
>
> It is conceivable that other systems may want to pass data-lanes down to
> the driver because they won't have a media-graph but, I'd say we should
> arbitrate that then - leave it up to someone who needs the fields to add
> them.
>
> =3D>
>
> lanes // the CSID and PHY should agree
> symbol_rate // so both the CSID and phy agree on symbols per second
>
> Remove:
>
> - lane_positions
> - lane_polarities
>
> Since at least for this series, they won't be needed.
>
> The CSID still needs to know the number of lanes and how many symbols so
> that it can calculate bandwidth so .... lets just include the data we
> know we need.
>
> struct cphy_opts {lanes; rate/symbols}; dropping lane_positions and
> lane_polarities.
>
> I've no objection to the low-level timing variables myself but OTOH we
> don't require them at this point in time.
>
> Perhaps drop unless/until someone can show a need for them.
>
> Excellent bod, agree with you now.
>
> ---
> bod
