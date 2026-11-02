Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632744;
	b=DczdQjgB0dHpYUUYzbGHdVzyTUXhpnry6MCsUZ1I6bZG3Jod92mDRp9J9sN7iDsp6QFS
	 l4c3uytMMRxTIjR8X1omgF6+96jOK7BH5Kdb7Xf5yI6bgbdxhVCSC7t7p4xRvQHFPc0QB
	 zJqqOIwVc6Sn9t3RAukK3iidv7sor5rm5Ofxk7Nns+0yjgbSafRDr8fgIq+qig3wWXYsY
	 5G+bHsru2n9yK/5lzmZ++AfcVRbzi4JAe8CETx+HrolrnzvA9Bz/p58Q6bgK8xUGqV+QW
	 Tz7D+uKcIqwSIMDFxZRgk+CbksljpjIk42cirFRd72+eUOuhO/iSt0fBVOVJIWzcVYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
	b=R3G+AMWOr6UXc3vDSgiSTMdJGWF47nDZGjG5lvNf/kv/M1J4LUBIBQLLtV+S7bc6GoH6
	 /8mIbrXlRc2K6m/oG/v2WLM4jnhiHKN7fkbTmvMf1iXF2thrGtImy1n9rrfwEaNxFXUpH
	 RATyBW1yADrkqfBzw7NCuFQyN7RvNxgcUXi1wn2gqFHYKmcqcagc0+YyEthxoXmUH0mAD
	 /yPhA2WkPonBM7X9SevLgNovPPlf0Obq44BqmVIFcNPtEIwDe1WN+2pvnbii+EhCYxeVA
	 mR+66x5iz3gGSPT4EO/ig3orP+vwQci3vMNVAiuU55eorSD3B6JGusc7eJTtxl8W3dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AsoYHNM1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7+lWPAV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190A606C3EB
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A190A606C3EB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AsoYHNM1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7+lWPAV
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpDm23512214
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 15:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=; b=AsoYHNM1PRbrLXhs
	n0PfZm4CpkF4ME8cWSfYFh00O2Weh6QquG5y88C+fIFkVb2EFSY6hZXzbhxVQX8p
	lX3ei5ZV7Zj2GZblijdF32XPg/AL+IwWDev02eXJbhhAMlg7Z3w83YoGca6aqQR9
	jXBFFCgjoN+i4zDAjibV3acXztEBhXPEGyqA/8jTZCE7eIm85E72NI/ybIxa4BK5
	ra5JxX09emNPSXzfZ4To0dLcF78b65dS0qsjKKAhxduynYUQd2qB47ds+qzswYsM
	0qGJKlXqP/TOmvVKNMRdCuzbFdRQc2ntJ7oRGb4ibH0rvouMPCShwPpSQF3uS01V
	NiljXA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrhgng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 15:19:02 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so4626201b6e.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:19:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632742; cv=none;
        d=google.com; s=arc-20260327;
        b=KKpLP09w+2jtKdd1obnFX27/FCNVGWSai6W1b8JERKYe+f9a+ctFT+cnVrbu1naKpd
         rl8UvHJt1tM2E+RTsm+hTcAIyFYB9Yn7R1gPtsuWHctdvhKjGaWcbAcoilb4AYbmM81k
         h5SaReTX2EnYnLXwmFDirwsN+EwjPCoJz00w0Nql7lSFDvo3vWt1kq1CxoJoUfozwQ0e
         0CURuxnhZ+wq8Kxx7DEyvy6E91BN0/TURpptU3K+y1odjTCwA10PNBPlBXhedGM63NwH
         YcGmHi1glulhtYO1OyTNYS9HhhvixXhtX/tbYc4TqDxhMYw23/QvW+cnFt0Z3QvYVxzs
         TGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
        fh=MxUDLsZ9xtD6paE0BdcSIU5qBKdqOJVvzURVUk9GdxM=;
        b=InVRwYROFt+ciSqw3z6nQXMHdrRsXWfpmuOh6yACIlrEZfQPCWi3bhsU/mw0MlQxR6
         2xycKxfhh+0WphKhd42ddYFRsYzp2iHgukAnZNcJ/tp31ceFfMeyLEa7rQcSI7tFfC7v
         XSviAa5Eqy+lnWAGV8C/d7mtyuKU+y6vB6ilbK6EKmFviAElYqa9zaBLtkr1AD2OtMZC
         tTU0Krd0gmijTkYy7P7b9IZtMYKb5uoxiq//wtsFOPcf0kUsfTkh7kgzS86s7sCoWvit
         ZG8BPRAByA5wOqTtwdgujauJdhs0HGMR9f5BkJt9RVEtMEsGzaGFcOWNmOgr4F+/Prs1
         XS2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632742; x=1794237542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
        b=O7+lWPAVgxPy0p1RRDaAzo3lJUkNUkUe7E6v6d5BkRFXh9EThj4a+Ns013QUJzE1is
         tjQOIPg1ClqPZfXV4qQSVylbuQv6o+vAq2exby/HJD+gRZ9732vHIEooEnStrfSlpNhp
         jHhAzMTdDWus7BYEhda4irR0uDK5nFCyOlnt9Whxn4jl4h2BT3yTH90k0x0KqLO+L4NA
         8E96el5a97paftOUHrgvdwrna3MSGERCYYeBTmko7CSzE9b6Fc9z2VJGvUrKP3CP62Rn
         xPgipmRgjw4CbJTHaXZCDUuA3p04jE3lfwYHs+xPB1L66I1jN3VMRvaxdEBlJABNU2Kb
         x3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632742; x=1794237542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TPCp/ZfUGDwZY7AAgzK/IQX0AhOazCyOsqyipH+VYI=;
        b=i3x7iHM4B1YFyQtQahOPpydy2qBYfMFKYQTlR04GLS64opiB8KsH65x8AwL3FBGU7j
         R1CNdUKMKzw1a/eM6+gfTWgmY/5X1+Ngm53P+uuAZqwesU7YK6n1s4ZlJHBuXmzN6R0T
         8QS9WaJrGAi4pmgBr9QIqbV4JsdoTUx7JyG4Ia4bkPywQAkTStprMvsd9NsJWbT7QU5T
         xAO+iwK/V6nFeHhQBVX/69KMvxxz2lIDqWGLeEaA0oRvVYoIezrQLgzEHIYm5WaGorv/
         9HNgQGvF+KPK3sZ9qJymjJ4uxn9ayMGSfkWZW2NUed1P3u1Bst/bj6V7mj36bhGsoHWB
         2HWA==
X-Forwarded-Encrypted: i=1; AKwUvBzs1VhyxiMtdTbduwzyRe97lDpGtiF/QNyqvv87UMCFZBcBj48jYHiU3flHP60Y6E3vrm+SCZy9Vd2PQg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI2TPTSx3ZITXwOTgm6bMcYdekSxjhUSvVU3sYDUwxcWwIkIkkW
	HEyGV5xkSQHvJqneIrjF6s6luPw1PPYRHBigCHzGUqsAXiloSu1d73eFhsHYMgJObgLg9X0QGSH
	xvpKQgtK5AhgCpSyj7zhCL4B1huqJgXxWQ6WoVrBRIXa0giiRpFV4Ac4/boeoaJZI5xIQsbkWQi
	tTs7nWwieRn1TzVTy3DOc/RuA6+Ejl7OfuF8eDg6Y5
X-Gm-Gg: AYBFou28zF/T9+POx1Hyuii5whWMITxnrfKachxoO7zY/MkD9/v2MA/4zSRNs9WbbCh
	HdJeotpL2AQ1DrhwmyTt0LbhcPoWkp9sNjzJxJblpZJ6/wBeVawvMPnvwQZtJKgrcNbC4woY5Z9
	uBNuvnQtVrfFZ4GEaDnZBi6hFT+yzAmx/e4vnv8Bmt9T+9Tp/LmaTCA6xeWAfpCcaC5in9eWxZf
	pHNz0xTMWVhcwsmRHeq/8tBwZ1cfFju4E4UK04eSfxuvaN6k0+pdxsjs93zU6j7lCdNQ07FE3/u
	c4ZI1IOLQBhbSwij6Xe1cTAEnDxf
X-Received: by 2002:a05:6809:8f:10b0:564:22ae:a6b6 with SMTP id 5614622812f47-56422aeacc9mr3332398b6e.41.1793632741899;
        Mon, 02 Nov 2026 07:19:01 -0800 (PST)
X-Received: by 2002:a05:6809:8f:10b0:564:22ae:a6b6 with SMTP id
 5614622812f47-56422aeacc9mr3332381b6e.41.1793632741440; Mon, 02 Nov 2026
 07:19:01 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-6-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-6-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:18:48 +0100
X-Gm-Features: AclHuK90Cnt49M0E3n-GEq5a7HYsx7101LK5oGlS_JqmbiqgXrkQ5xEgnXx0FJc
Message-ID: <CAFEp6-2-v3=wEixsWfu32qnqbQxyRL+N7_WbLRKerjuMsKjZ0Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] media: qcom: camss: csid-gen2: Enable RDI SOF tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8a9e6 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Wf5Y_Iq7YOo0zHmYxc8A:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: K0DJyUwCc1ufA15hr6lpSpDP70iEgRN_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfXyiW11YBUundG
 3HSdONRt20ShA9ju8n8ab5jNuYCtSaMuDXubaRXChFmYzxCyDf4Gro0FRpyTRtUnoba1TaTjw0f
 mOsmrkdsa7GGgGpC/gMQHwZD846EXVI=
X-Proofpoint-ORIG-GUID: K0DJyUwCc1ufA15hr6lpSpDP70iEgRN_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX/GA2Mngx/PNP
 c2JR87634ypns5kAHfQ5sibYj8wED4E90B1LLO09CZZDdWfFIzg24kQA7BPWpS931QQqLYrpmPQ
 XCVoNAy4NV/wC22ebs5k6ctunxXA3RkgDl0J/ImDqnH7owdkuR03qIWw4yDVQm6uKTB4JsjI6f9
 Fn3xuCByzs96INI/jXL8w0Ck8PxOKAjWWSmQaynWLAclx1FQOtg1YxsFMWezixEb/gtTIxRep0x
 gu0NgbytGuJLZnBkw/Ip9Vc6jVG6Xc1TyQ8ortsyxXMOIZ1vAA4fYatJrEBb5OjLrCHGG+8MRiH
 VinbWo5r0P/zADDqNDWhacvqYipm+swt8M9Ll20SMHL7g39pPS8FTBYAVJ8tbIdn5x10azhoM9A
 wkCb7lvWYsoB2w1E9TrHLh+gJdaSsff6OavTFSUlcLTL1U+CdV+OlxZk2OD8kFAJrWoSxH3LKaD
 ywbouj4IqG1B1hxwikQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020060

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Add silicon specific changes to get SOF triggering V4L2_EVENT_FRAME_SYNC
> 'gen2' CSID. Covers SDM845, SDM670, SM6150, SM6350, SC7280, SC8280XP,
> SM8250.
>
> Tested thoroughly on sm8250 only for now. An additional patch is required
> in camss.c to enable this functionality on a per-SoC basis.
>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8250
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I guess we don't perform a read-modify-write on the IRQ mask here
because SOF is the only interrupt we're interested in.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f7e3aaa..a351ac4b91728 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -38,6 +38,8 @@
>  #define CSID_CSI2_RDIN_IRQ_SET(rdi)            ((csid_is_lite(csid) ? 0x=
3C : 0x4C) \
>                                                  + 0x10 * (rdi))
>
> +#define                RDIN_IRQ_INFO_INPUT_SOF         BIT(12)
> +
>  #define CSID_TOP_IRQ_STATUS    0x70
>  #define                TOP_IRQ_STATUS_RESET_DONE 0
>  #define CSID_TOP_IRQ_MASK      0x74
> @@ -322,6 +324,16 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable=
, u8 rdi)
> +{
> +       u32 val =3D 0;
> +
> +       if (enable)
> +               val =3D RDIN_IRQ_INFO_INPUT_SOF;
> +
> +       writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +}
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         struct csid_testgen_config *tg =3D &csid->testgen;
> @@ -335,6 +347,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       __csid_configure_rdi_irq(csid, enable, i);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
> @@ -373,6 +386,8 @@ static irqreturn_t csid_isr(int irq, void *dev)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         val =3D readl_relaxed(csid->base + CSID_CSI2_RDIN=
_IRQ_STATUS(i));
>                         writel_relaxed(val, csid->base + CSID_CSI2_RDIN_I=
RQ_CLEAR(i));
> +                       if (val & RDIN_IRQ_INFO_INPUT_SOF)
> +                               csid_sof_event(csid, i);
>                 }
>
>         val =3D 1 << IRQ_CMD_CLEAR;
>
> --
> 2.56.0
>
