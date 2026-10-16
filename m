Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD61C862F
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137383; cv=pass; b=Z2fgM4sn9lKruDwTgHjJ1PvzL8DBbyYwLr5o+yhMcHOX6rsPQ8kJDlqidzJVBxXPOOiEpRNJZyKFE4OaaUR6N4v2LWcP+bYCGUAoger1tqluEycVKSGJL9MHqWf8BKDMpvbFgf2ta2HkA59K3YoBZW9xawyAMMxZZMTsa59jNFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137383; c=relaxed/simple;
	bh=VxP0hZ31lGhpRchEzyV+aetw22Q2teS81UDVEDMeCsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQVJdSHOn/q1UWfHoASwBbFIvdUIN3AATtQcDB1M44iufRasJ+KM9CtLkmigVdr/Gzd7HAaSXF+lQPe7wUciFrhCfjsdAMCORoo9jlaRHVroO7btjXppBh1smDAK7evnCiZsGvg7oV+wOQezwMRHn2AhDmz1tJUBr4OAhsqRGF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzYyKaVe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfMq1sOq; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzYyKaVe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfMq1sOq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G6pP263493014
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=; b=hzYyKaVeBM0t6oN4
	OqbN14OwDGvh7/Gbx8Z6JXtEVWmqZ/V6E02Jytm44sRuu+SYlIYXZgU7tYeeyIWq
	BewuE2ei2LoXTKh9cydz7afjbXT+jI/rOm9HqUItKCdC9QiIt/2v0VXogxYvHjUE
	N+z5NR4yoS4L+16yWKBE5ADTaH/GPPppx5PKaSp7wmpRSSckQg/Rk5BC8SCgSEdp
	kfpBzQAwwtODE3Zt/iVQaqb9Ge2u+IpQKyNpFoNU2JVdoCVvIDqv35G/WFwhNs/q
	GSkDxzBK4gEG4SksIDGzbE8a3uJAXpSqWylygxkxwSjwix13qtaDykg0Rif+uFbQ
	4H3Usg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb21wu7ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:56:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso1698062185a.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 00:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792137378; cv=none;
        d=google.com; s=arc-20260327;
        b=YbmErWZbzQHwHSLGJFxKS8bJiJ4Iog/E8tCgSvTdAVA6J6AouNB57QG9HCOIGGuyRL
         6VCKYesoUtzNYbjFAW2yP50XR0Q4Kr4qTzGYfJ3ZaklZEjBBlXVXywvelJNvD+EzcKG3
         DJhalZ+9qRwoN7LzWaHBphN11H6DURz6NmuFUMnfUAvtzyd7a063XHM1r60wUXGRq4Hw
         ikiYOlT2r1aUHxRrd77v+TpKqgAUGm3EsDvdqWo2aoYHs0lMDv4djd+qSPUAwe8mT0Nz
         geQbHAkPE34vMfEKfMzk+0ffEWXfUi5WwQLtur64kVeZSwce12mY/PVRAtKzAqlAv5rY
         hibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=;
        fh=pfkoFgPvzrvT0j2qEPp03mbKfzSJS/wNnufh7L7TIGo=;
        b=rwa6rz8iu59Llt6NxClrNl+LyvBkBNkaDGMq8gNa8f2dt3fLKxwII+MH+jOsEkLZ2E
         9UlgRLG9XaSIhKXfETukWuS+Ne+Jt8uScss2r0T9Ec+UzA7g003QYDtYhcxoAfGJwAT0
         KQIDc+HA0gV3zLbjOKjwzxfxymrZZq+8ljOeVPRWC/mMY8PkFVRS2SyTBbxlg6OcUKRN
         3n3zuFFm+6008LwfsK4wCXl5TW1K1JN5gJQyb1/sgMvGJhMu62QDwXyBGzt3PTrDPY/Q
         r5kEGSzm1CCyoFg5S5UP6VMZv8IbQpsGpjVLEAVsiB2WXi+zn68RXvsXFVXxvFXGkw3u
         69bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137378; x=1792742178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=;
        b=gfMq1sOqb8pg2AD55xHEQOts/sz3nW5oKCPLtUh/iZ3QB8AuLI6bDm57bkzhPTluD9
         Ur3AVRrIo1NcayCfymyt1++c7hXdWwTeSSvoZ1wXH+Qn8qRprB11nckdpkjc3Z13SwsQ
         1UImJqsonjm/8ikqSUl8IUB8LpCsFv6BUoQcej4MT9/+cPDBtWFoFXPP16ODtS60jWGw
         UWkjAyKLlXnEO/RPibj1K/27cvdc5/45SiaBrCP3JoeafW2w+zKKqck9EJgN9A9HP/+g
         3G2TWvUJM4kofH2VTUNExRWRqclP5wGMmnd7xx0rc/3HGUhAcPx6TR0NOsw+nE9hppE/
         LnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137378; x=1792742178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKjHJ1pVqYFFJBRsIMQ60p5qHGl1vtujYesr+jTvVXI=;
        b=2a4eLTe8HX05JjBwb4sSVb4PaV2FscXYoWAm0DMNzr3lCZi2kDj6gOcePGz6gGwyiO
         J+1tMId4ktbjc0lWoEeiaEqlU/KSTVoMp8lXVBBnP/+cfRTZEtYvh2rAPCs65hlBt2XT
         NqcC2i1EehVD0ZQYHMZoMhU9Mh0jLvTee6NyruawdgERn8sNEczhsOlK0HBr6y7ODsNf
         zZjCMBSyab62F/tkh20Fm55TRH9uacLWrCI8v9YCE4ximKJ8XkjmcOkpf2awYY5pwnXg
         FwtL27DafJY+g3FQXS64wnS3eQZJVyQUVh4a3V97aoZ4HxPhlpEyQrp+h7BdmPobcLzE
         cLLw==
X-Forwarded-Encrypted: i=1; AKwUvBzcWwV1H2SVzE7JgWJKnlr2wpacppjXtCxtnhSIlL7O4LTt1K92eaRi1nzrV450qp0MJQINKW1Br9u0XA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIQFsVojHwX4otsdPzK0JIrW5dz7+HRoCIifWd9ZP2oADKCsoHO
	ORsn/J7RyuEgxPd9WVh2N6Nq1XK7Q7yXMskGeJopR7fZEB34vEKIAc0DBpOiMEt3syIBQ/mmioi
	cSQCl477FgzYzp8ChRuXDEC4oJwEj10+xgjPi6oCnGjFple6JuLHMew7kuqM9Sf/T3RZe/EAxCs
	1Q2wbndShq7Nc3317hMna8PSUITSffuydx+FYfl+xN
X-Gm-Gg: AYBFou3upxnoGOZpbseHI7OguG+uG3PpkQ1CN1/INOZsQx7TKtIBrBzhe1gMEemYtK3
	IFx/DwW75CqWWi9oZX67UOltpCKfg+1GNL6k+a7kJ1E+bAYhlm8s+9eYRgNqd9yPUWi8NYsS6Aa
	vPkiXINWb+6LEpZUCq3LYxJbb9WSZzy/V+23EWgjhuCtQbpEB0eWDc71i2Gg9XR4lrBiFVUvB67
	EgnHMTRC4FD62LvZk9tU0V6BFGusnvxQ6dDejv8AeyUN452vbwLbkCPKtW8RcX6e6uHJoE1Q1hD
X-Received: by 2002:a05:620a:3947:b0:93e:6325:ae6d with SMTP id af79cd13be357-93ebd248dd9mr3909710285a.40.1792137377714;
        Fri, 16 Oct 2026 00:56:17 -0700 (PDT)
X-Received: by 2002:a05:620a:3947:b0:93e:6325:ae6d with SMTP id
 af79cd13be357-93ebd248dd9mr3909706785a.40.1792137377058; Fri, 16 Oct 2026
 00:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-4-1f3fa9af940a@gmail.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-4-1f3fa9af940a@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 09:56:06 +0200
X-Gm-Features: AclHuK9EtofJ3KdOY7tsLgDR7QBNZwZtJcvmiZFhadgSBrUvuUDEDEKnQ2RLZCs
Message-ID: <CAFEp6-0GrFoMFe8kqhkOdvf5_XkuZG_AmrjTMxxfBABda7132A@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] media: qcom: camss: Configure C-PHY through the
 PHY API
To: geocausa@gmail.com
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: zR_ojzW3XmlzHimTmnskb1nGM9OBqiY7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX2shMLMqddScH
 JPuyRFjfw7biubeGHW+d93UxwhwU5Oz6/OyD1fBhfmiKiRr6E1gimswvqjtqA+GAzzM1GVo1I7z
 LkI4zt2+87kUKnIWk3lb1p9y1LkRIk28/iCQmpiaCgaP4Dd/dosM++v9ONeSuVabm1IlW8vfDZf
 GLUzwxhbH99yBDj0kC1q3vZYEt9ukRWYtKRdE8tIqJC3ygPY/uDG1rr4u4zyPTaQ6BQ46LAZ+Ck
 SxGeH65nI0Zq6Q2sHiAJqEJLO4bRkyKfvuNy1qQh7/oAUU+oqVzV5b8ng9LfuiWLYiwmhZ3RDIS
 kJrdhIMupygixZLaICKMCrj7sX6nFlFzX4M35xs2PdHoFQHS3epEUoBvJWfyvhe3Cawwo+GlJ1Z
 cxBUvPPtj2Hwa27xA7Mmnju4cO5hRCAsVWbPKErMeqhikO6KZNY2OkgtirHtmiDBhliRk2v1rJd
 SQZgZ2yI9ATM7XlSUZw==
X-Proofpoint-GUID: zR_ojzW3XmlzHimTmnskb1nGM9OBqiY7
X-Authority-Analysis: v=2.4 cv=R5qWitRX c=1 sm=1 tr=0 ts=6ad1d8a3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=jTXrqqeG4OIbzDD8fVYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX60nztcPkPN95
 J2gBreskaAN+g47mduPQLgNU4yQGcn6nS2dA/XWfKEWE5V56w60OMEs7KMdeHhvDv6MhEvkB/2Y
 xVtFBUsNmVDOKJ7FD1anr9AVqpt9i2s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160031

On Fri, Oct 16, 2026 at 12:20=E2=80=AFAM George Neacsu via B4 Relay
<devnull+geocausa.gmail.com@kernel.org> wrote:
>
> From: George Neacsu <geocausa@gmail.com>
>
> With a PHY API CSIPHY, csiphy_stream_on() always asks for D-PHY. Ask for
> C-PHY when the endpoint is C-PHY, and pass the trio count and the symbol
> rate, which by the V4L2 convention is twice the link frequency.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 35 ++++++++++++++----=
------
>  1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f44f2aeb9..8e1b4335a 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -329,17 +329,15 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
>         u8 bpp =3D csiphy_get_bpp(csiphy->res->formats->formats, csiphy->=
res->formats->nformats,
>                                 csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
>         struct csiphy_lanes_cfg *lncfg =3D &csiphy->cfg.csi2->lane_cfg;
> -       struct phy_configure_opts_mipi_dphy *dphy_cfg;
> -       union phy_configure_opts dphy_opts =3D { 0 };
> +       const bool cphy =3D lncfg->phy_cfg =3D=3D V4L2_MBUS_CSI2_CPHY;
> +       union phy_configure_opts opts =3D { 0 };
>         struct device *dev =3D csiphy->camss->dev;
>         u8 num_lanes =3D lncfg->num_data;
>         s64 link_freq;
>         int ret;
>
> -       dphy_cfg =3D &dphy_opts.mipi_dphy;
> -
>         link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, nu=
m_lanes,
> -                                       csiphy->cfg.csi2->lane_cfg.phy_cf=
g =3D=3D V4L2_MBUS_CSI2_CPHY);
> +                                       cphy);
>
>         if (link_freq <=3D 0) {
>                 dev_err(dev,
> @@ -347,23 +345,32 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
>                 return -EINVAL;
>         }
>
> -       ret =3D phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num=
_lanes,
> -                                                        dphy_cfg);
> -       if (ret < 0) {
> -               dev_err(dev, "Invalid config for link frequency %lld\n",
> -                       link_freq);
> -               return ret;
> +       if (cphy) {
> +               /* A C-PHY link frequency is half the symbol rate. */
> +               opts.mipi_cphy.symbol_rate =3D link_freq * 2;
> +               opts.mipi_cphy.lanes =3D num_lanes;

Wouldn't it be cleaner to use a similar helper function as the D-PHY
driver does:
Introducing a phy_mipi_cphy_get_default_config_for_hsclk

> +       } else {
> +               ret =3D phy_mipi_dphy_get_default_config_for_hsclk(link_f=
req,
> +                                                                num_lane=
s,
> +                                                                &opts.mi=
pi_dphy);
> +               if (ret < 0) {
> +                       dev_err(dev, "Invalid config for link frequency %=
lld\n",
> +                               link_freq);
> +                       return ret;
> +               }
>         }
>
> -       ret =3D phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +       ret =3D phy_set_mode(csiphy->phy,
> +                          cphy ? PHY_MODE_MIPI_CPHY : PHY_MODE_MIPI_DPHY=
);
>         if (ret) {
>                 dev_err(dev, "Failed to set phy mode\n");
>                 return ret;
>         }
>
> -       ret =3D phy_configure(csiphy->phy, &dphy_opts);
> +       ret =3D phy_configure(csiphy->phy, &opts);
>         if (ret) {
> -               dev_err(dev, "failed to configure MIPI D-PHY\n");
> +               dev_err(dev, "failed to configure MIPI %s\n",
> +                       cphy ? "C-PHY" : "D-PHY");
>                 goto error;
>         }
>
>
> --
> 2.53.0
>
>
