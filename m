Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795522815;
	b=tWtBzOLjvmf4pZsKLGro2domWbnM4IGj0u++J4b62PhotdT4c4Q2ePRJqVDoYy/WxvTr
	 bkr1bLKQAEqIK1WSbvt3XVTJUDrtifUfJuITVGVc8OlbLR/+NeDdjmJfGgvIVp22NnRm4
	 jVhKo9moeTVVqtyZ3e2X3yFdyYPUqXhIrP0yMG15QXUrg1stBIcRzRYOvHxHKzkmnVkBS
	 6SbHDHrDiIS8/Mw1KLAQrlwtJMNt4gfHflYMXh+DBeV3BkOQU/UONfXZrbm691cHtwDLV
	 8HN0kx3Zu5W1oNOQ0IrNy7uTr6t9dXJ/JD7x+x856LYUJ95UlRUZMW5O5CrtvWx1kdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
	b=h1WLlFpB78habGWglcl0LlU7p3h7ki5Z23Yv9UI4ooV4wMOgSpVGCK80vJ0t/8WTODTT
	 1cLeM9FumG4oB6VMR3Lphvfz8tEZ+llkjTOvGgd4eS4iZNduF/6Sp8O1KUNmpE5DYHhQa
	 RFLhKmfmNo2PuxRCxWBuUKH9us3b+KwQ2CBpQmHuDT4eckIN5QIbDuxpOSbI2PoXJAvI+
	 RlXUHf2AfrGzb5VipUosyc0oxKgWGnbaCTNTT0/n8JaEAxzqGQAxug/lH8rABrtGL+LSi
	 0YXMA+Bfmv02DTXKpPZkgnlOJQmPY9xM5RWrJCatHqCKCjXaYcuvJoqQdYtL7Xh2UZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kov+r1Qf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq3T142L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FA5606A333
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FA5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kov+r1Qf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uq3T142L
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAusWF1291766
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=; b=Kov+r1QftyYH8jVC
	ajyBFw9xfcFUWym0xUhvCQugPqW5GDZBQ4reTqVxtrPbxtaKIINvSY8i99njlFcW
	5LVYJ6JhL3eQOO2YJ6/mnqS5aSZOIuk9GpdEl40tWAGYCGzuKAzOhNKcWHSo8khg
	VTLQ/hIT23fABK8PwKqDcvyDnyOmEsRM1WgGFKr+R/62ytzjLgwe4HXL/tlSJ1j6
	KshTRS1ofmHvR15Sjr8pUsmpbQk9j+8Rj1lmdpEXw9BnxwVs9P/ZTMBor4nVdKoy
	w3uuBcbZcOHbmz6xGhK3kgmxPrfezM/8CWz0vK+pspCoqcQNxOrIldAlM/wbM3sA
	HC+KnA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrbn0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 12:20:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso800780985a.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 04:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795522813; cv=none;
        d=google.com; s=arc-20260327;
        b=E9RTs47yqzpXauCZBl1++ODnGETBsyu/nkC4Uj3uXOVxJQ4iBYpWJGPMmNo5BkGLj7
         oMp8jBJCiuEtQG63xCf0nZn64PQwJ60JKQVK6dmLbox/XGkQ/rkd9wBs/l1lBB+6f7Zw
         9bqkHmHBSFesIE5B3R0vavHIml+zVkovFKF3u7HPU4mTrUVKRbXOMvKREq2GlBToVO0k
         otADsUNQ25p2ToTR83nA+skMS4saNmWIP/UHYs1zBbzprvrXr0XsMu3KxbfVK0o3CVy3
         0ncIdBnYp5vpaLLnpEuF7Z89NDiVgbdcAuF3PmDUAL/n+U1JH5Grn60iltjdPl7iHOuJ
         TDUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
        fh=DHxOJ54QSgZccL72AKDZo1948h/izHI4nbdPoxAmlko=;
        b=LqEN2QZhLMCBcNxtXEtefuwIhTGbKk79KjD2PYO+e88ij0kpUYjiWb5qaLeFELXGcb
         QMhxkp8upRwJ1Mrr59NhlO/IaAWbzCMvD0OCm+QSK5s8Eq8efMn/48RqipMtagR84r+W
         543FuY/w9AOfCu/gCigHA+W4x5cYsvNtEXnotRdcyu7+e7gmOT6vvFhEg/TrqiQ6hhtC
         fbuw2JfjyWGxolPJ8X+6zHtVZsNJExogs3HE6pZQ2RuOtp3rZQoThLSIBgQoCT+o2tJJ
         NuJDrlCmHdmug9Q38pGIPi86G2J2CBAgulAyuDpuVgdjNYSEB9kPWPUz7W5oKS5qJuMu
         bF2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795522813; x=1796127613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
        b=Uq3T142LKQPjbCOfDd1a+BjmbQgQ4kQXDVsgVmy2CSd5ubQX1Ez48OkbtTNIq/0DKU
         jWyuA13VUhJoJyC6l1QsqDLsimjb5OcmRFwQtNMxHrnU9ZAHwrdIgiby+gWR9OmqaOVv
         KqL00C4VqSe1/Xbxg/9qZgHFBiv/D6YOkQ8XQ29kmFWS7149Wxqd2D82JV0x1Js1bGm4
         PGTNu8rd2DiPR3XdgHfaFVAkGzyoAGjkTshnXhShmAa5xmhA6lf+XRZqbC3ocRw/wsfO
         r3v+Twnlo6Un8B+XRXqnu3IO+4ffamrsUHPYxUjpsRt+ek6tgZIbxL7r5OOSEiWq5i1v
         hCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522813; x=1796127613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6w6rwfse9tuUNMr61NQQ8PmXyuTsSpVSaitZotsL9z0=;
        b=DAacfaSb3k4g+hJh2pHzsjJWVDk7FhAM7l2uOwIc+Zjg222lUkTrHbSgxjH9zibjLv
         bjD1g9hhjGrSoUvNUUJkGm7g+f5+SoTDhO64y5qnSt0y2JsdRuQGMI+9G/IEjfMaZJZ4
         6e6JFJWm2O5Or33I2JDjlE3EFCl1jgSYSJBy4320LtkEXS3OTV8rbW62nppnZ06jRDbs
         5qh7Lpl2kwF/RzLD+j3+PxcWSpuwNP8ZyCc3Azrqs1tkmaiXxs3F8el1/yQRyh8JsQwX
         nAIDft1+ZU1RaCtk1HsCeCjKcm0XaX7pSkR9F8MpihxEvqf7gS35ePasiTFXlvKNW9xv
         dq2Q==
X-Forwarded-Encrypted: i=1; AL+hErGlJ9xHBqmR9cVe/+RegaY2YvnswsSCdij1B6oVK1g2fMNOMeISFlEraerBGb7gbjOdx83I0JwWl88RFQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9yotQGULXibwXgYndF0R8ilBct1SYTLT/ZWFIx8vR8s07NyQIA
	KjDzUNO21WTdnUqzjIU4oXH81JZ+Vmp/UK4CHnwgbvnVFJErUgqSgZmoMzGdRM+Mfwaf44VqHdW
	XUv3BJjwRqJwH88Y8MhTtbQfaWG073qKbujfwG3blaPD63RICuvOLLKdc6qwKOfZq+eoTnURIBe
	SOqxLmI83x/QEdxquVU3T7kiLJYsvuR73gzxLvLRZ1
X-Gm-Gg: AZFdTZcZvsHYhETdg3mLUy2RNgNXJ7ioh4Fg5A3+ZKEuCaRZ8UBSJdTDBI+ji3/vtRs
	5+6SNFphJzjhDfCPFZbzdOADZBnC3X6QQEFAKxVglydeBRUZ2QUuhwXC0i2tbHavfQ8YHBSJ7m4
	/347iUDn9YgS591o8bVsh9+HBVe1gaZ2wejeS/o35YfnGzN7TwRY/Kistt0NJ98ZdCfJl9ZcCRe
	KGPqPW6ALVirkvOYwKB60g0FWGBqHksGKPMbdLeQofjFjTnFcjYICfNVAGKA72v9nTP4omZWf4=
X-Received: by 2002:a05:620a:6c88:b0:949:3644:edc0 with SMTP id af79cd13be357-949ba9c6825mr2317507885a.17.1795522812712;
        Tue, 24 Nov 2026 04:20:12 -0800 (PST)
X-Received: by 2002:a05:620a:6c88:b0:949:3644:edc0 with SMTP id
 af79cd13be357-949ba9c6825mr2317501185a.17.1795522812198; Tue, 24 Nov 2026
 04:20:12 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com> <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
In-Reply-To: <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:20:00 +0100
X-Gm-Features: Aa3M54pX1s8pai2gj6XcjiFfq8IfONplkCIxIiTV-7ktwGrAeuzyti2xMDsPav8
Message-ID: <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
Subject: Re: [PATCH 3/6] media: qcom: camss: csid-340: Report the hardware SOF timestamp
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfX3I5DqDBLysGk
 9p6Rdi0pdMyZiKdc61bUC5qkA/IjTwSTagoQ16rNhhCmkBAuMzKgpcuziisiF96ImOYIlmU+Pyd
 UwnctlJ8jjrdjBbaD1KRyoS9/kfjj74=
X-Proofpoint-ORIG-GUID: f68wF8pClhLG31SwZ2RHFXQrzmhTzku5
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b0580fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=ifR-Ftivm_Zkcip0b6QA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0NyBTYWx0ZWRfXwA7pnq9yiiqd
 32O1YJYMJ8MhOJkuDALbGD11eS/GZPSFT+4eQdD5Mh23KeGYEz03Zf2r90vxiQvjNRjbWP6GpOx
 bGzXkNwCn5a5gw6CJ8jEgUEi83y1QA5dj6qokvHCla23VYrrx2ZOMmntznXroFJCVc9www2oavI
 8aWES/jT+GAR1Kr/kS4SWlPMTz/w0rw8QuOliYvCH3GA4tKdwdqM+7Fha3j2BZs2rBcx1biEVnM
 5lG38cOCEPMnUGUJhW+f5h13fFuw4uw5abFiP/9R20pmJJHd3IhG89YCXilmwt2V14mrzLvE3JG
 zYc2p5jabxNWoxflji+AJYroBTGmh7byImdq18Inm7KQGGwzIH8OKBk1vlvE6QlLY4lB39CQkpt
 tyHHqs/8cKRr+UfSrs3cHrhiijq8tO8m8u4qZkTa9ZzBtVZpJGgUqdErxYoNKwLrz3ETInhp8Yt
 pf1oRWurQHbh0ahQibA==
X-Proofpoint-GUID: f68wF8pClhLG31SwZ2RHFXQrzmhTzku5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240047

On Tue, Nov 24, 2026 at 10:57=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 23/11/2026 17:16, Loic Poulain wrote:
> > +static u64 __csid_sof_timestamp(struct csid_device *csid, enum csid_if=
ace iface)
> > +{
> > +     u32 lo, hi;
> > +
> > +     /*
> > +      * The pair is latched on SOF rather than counting, so it can be =
read
> > +      * one word at a time without tearing.
> > +      */
> > +     lo =3D readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface)=
);
> > +     hi =3D readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface)=
);
> > +
> > +     return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
> > +}
> > +
> >   static irqreturn_t csid_isr(int irq, void *dev)
> >   {
> >       struct csid_device *csid =3D dev;
> > @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
> >               iface_val |=3D status;
> >
> >               if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
> > -                     csid_sof_event(csid, i, 0);
> > +                     csid_sof_event(csid, i, __csid_sof_timestamp(csid=
, iface));
> >       }
>
> I think a callback in csid_sof_event() might be cleaner or some other
> way to not have to replicate all of __csid_sof_timestamp() for each CSI
> decoder.

I added it as a parameter because it is provided in much the same way
as the sequence number, given that the timestamp is directly related
to and coupled with it. So it is not clearly obvious why the sequence
number should be passed as a parameter while the timestamp should not.

So yes we could also introduce a hw_ops callback, but that would
ultimately require replicating the implementation for each CSI decoder
anyway, or having some semi-shared helpers.

Regards,
Loic

>
> ---
> bod
