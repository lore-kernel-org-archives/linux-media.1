Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAC346D562
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465477; cv=pass; b=aNsMezNxqGPkSbRiPcGqv7WTu3Y5Qagi+PB/a47acFc3dflBou29S1W1DLmPcmsCBRd8P5ze5fSsQ1eod/Ut6OIF8DvqN+vz5Z8Skt0t2cHjDYB/P+dMeKmk4QjBy6AZRFNHClombLV4NQ9PNKxIn3G+09OJplnA+u2OldxDCSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465477; c=relaxed/simple;
	bh=bnMbNVVj2v7D9H53XLbDJbbR1wetYWN0pnhL4iZAsKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyadXjF9fFGiyvn9PRuQH8tGBCzIiYnvxRsQcHDHrlx1DGnLtljhLkHSr/fQRrJ9XonmRenH3nZPDHq5AHewcS17tpOXYlSIibFEXos2NHNg7GiINH6npUNBL0S8iO3Wm+nfN6jLyzczxA6QyqID5uhFN4k/5U/vTfcOHo3MYAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CswX52JO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BqO6+CL0; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CswX52JO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BqO6+CL0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h1Xd2086632
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=; b=CswX52JO4Piek7S1
	Nh5bNU4VoO1KLQKJHZi2GoNsBO93uwTsHWczoWdD5kh+m9XZtxEd23AQrjfDPOqB
	tX5Cjr+nIN1hQekrHcniYNtSI7eA+CV1XEJVBv9UwvTrgzNsnyjK9evluCd9rGjz
	+DkpQKne67MJuncyzn9NhnAmvFCbziH8n3MzIJ9uckeogat1TJEpjZHYbk5E7GFE
	hnkRb8LlCj/uwSTXPsevc+/qgw6cPGOY0d0/N1akFR8jVQ/8lqNtqBc/KHR1wL0w
	7WxbNJx8Mp54CGlfZ+XZn3I5piX949TDmuYC234iyBEY7w0iWqTsMCg78sI/1IXC
	z37DOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp8mtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 09:44:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a05d645acso725818985a.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 02:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789465473; cv=none;
        d=google.com; s=arc-20260327;
        b=hxwc8TzmFV6Jk3JBS0nDps23y4bcP0Q3pbo6AcueU49hSikdtR9PFjCiX8OvpG8G7K
         KOS8UZfOMV16KBOtlEv18xhIXM/5pIddVCfEin8mNTzSkNwg9IGMEdy/EMlhQ2BxSZ6k
         qaXTDPZjRWLUqiqtfA/QlH40Hw+WT9tgFFiI8ztq2uQ4azFNVGwEiscJZxqNBPvGeVZ+
         S+8ZrMXt3PfP0Sp9NnCABVW/WoGVUE4EfpHTREUE8wVt77r+MfRvJvCM2ksyQyO94rZX
         JP7A/lKvoVEV5GKvadtZNs26YMLYYMlp8WTj++Ojj1hrozi3RspWAQfbD+il1/OF9OW7
         9Mpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        fh=QnJpQfsppZNyrlORCCrrFwlKA+ts0XxAj+Cz8CQnXtg=;
        b=AeLAF90K9mq6lNTbdu8nw/ep4nME+Kg6PebTXnnxX32fXJ1HW9lhxcHWkKcDFQJr5j
         zmol88fyzbymWM0UmZOSfpZqt3zho3f05JXGKxZANcvAQJM5dJ+aLcN9OcQ7/Tgy1QxN
         b7EiT+oAP58TsEcQuy5m1A9mvjFYuq85IMqLDifdXh+oN+nTIbGBGDEuvjCr1nPoz01S
         Tfrms/+Ip1mSwbu0t7RNLCsJkqcxKgcmdLuiKkvbZzA9Rb5KFbS33QOhMbOAQgqCrKRo
         c/Rw1NuKi0xE15GxVfzJmuM7eUgcvVsT8/RFwa0FY0kzTqCIKIWIrCehk1uV2/e5cjts
         fhcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465473; x=1790070273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        b=BqO6+CL0bnBgpS1KoPFMfcK3hk9hoxkrNc2XYwBLMu14pNQTHeeR2OMQd98FD4vpJg
         vZ/lrPhoaEgsekh7SyNuP+wx/1toQyIeZLR9WJCeavjV2DfV66q1aHYLsT83oKAGvdT2
         ZP5Vd6eJA/k6EQ/CWpGYkJIX7TPJos0MHHBXon7x+E/Xx3MAxFwTnwmSDDi+Y+/mLsm3
         4AGYO3DW70kx68QyNv2dirIAomy5i0hl0UcWmTaMLboU9PcrRpag4PUXtqPlaUEKg5rd
         /iYf/vKf2G5b7AUoK/bhcExLygqWoa7ck92fChzWwtr6VrHgI0H6T/W8CB5ObCp5gZA2
         DTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465473; x=1790070273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        b=KszpT5yJpGntohuSJTiLNXA5GwrCViLpXMhXFmgyLhNEQJGeos0j9NZ7/MlJWrPC1d
         6M3Vsc0q4Z76hioYYghOAdZP3smYV4hr57IvCQlpmARLOXJe5OmaBE8BD3TZbcT5BcGo
         8jYTjrNOFuefhs12JxiDyZiIA1INiZ5bNqcREzxlW8avPqteH32MVcfELuWKYqSDKPWL
         5uXIy1/XGMFgzMTXnt0Zd6I+xtUiimzALAE0a45bNug2C8vwazwMNNmudD+TAbP/2S9y
         9TiTnwZ2GvXhVQIIDAYAcobJ6mWppe/zSzgyYt/m52H7f+18WZ0vQ/I1V0M7JjYSmJj/
         yDew==
X-Forwarded-Encrypted: i=1; AKwUvBzCi4OdrH5EpPYnYHF/6QFv8jOJ1qY8gkFcgxn1Iy5hIPfSoGWhwTMJOJB75MB3jw+K7uQdwFQZosvy/w==@vger.kernel.org
X-Gm-Message-State: AFuF++mqcXNx4xhJlM/e1aoo3m5M1Y6FbhDJRxNyBSk+3Rsa9dQBrwKU
	jbNZW80BtkM3Gx1JjVVy2C71MEivBVMpeC/wT1WINSvkrcnlnTZ8JskzrGLHiOdAdnk2U3L3rIK
	stzbiqYG8gFSfyQ9pQm7Pja5zQIPqJWWyTW4L3UjPIHu1GpvFXu4nnK8xhZEn/MRVdCAjCeCp/m
	JpIXqIQ3+r9IamlNgXQEYaFMCx59Sl1LoWhuuJtOsc
X-Gm-Gg: AYBFou1oEXVnnKydMeGtCR5nQiAIjcSsMpv4+0iDHl4AMKMXSstZtq/HQjzyXidVmPr
	34dfnAxkbNkFZn04rKg1V14cAIeaVgFNp3KJg0SRaWliX6UieXwCieQt+Xg/22p4cT2VaJ5UNsI
	9udRcevb5LmBybJ7Bc0CHikv+hNw4q8ovftfwolktahORL1rRgR/mEGrG0FZTwcq/lkFWySVBVs
	4ZqTvQyQLWT/Alk7ZlSq0BN2rKd0pH5iXMTxEBm1cH/10t/4OV2gAPpEYec56XGRF9tsNLdUUrW
X-Received: by 2002:a05:620a:1994:b0:92e:4927:2002 with SMTP id af79cd13be357-93a299edea9mr1021970585a.39.1789465473299;
        Tue, 15 Sep 2026 02:44:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1994:b0:92e:4927:2002 with SMTP id
 af79cd13be357-93a299edea9mr1021965685a.39.1789465472779; Tue, 15 Sep 2026
 02:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 11:44:21 +0200
X-Gm-Features: AcwNN1UBt5xNb7VDMYWD4BT9h_axCpKQfZrvwQ0bvr4VpK98SvAM9POncAzr6Lc
Message-ID: <CAFEp6-1meC7+XV3nVUiqivnpPQwDnDBRNCtmDZ-OMG=sLkxAvQ@mail.gmail.com>
Subject: Re: [PATCH v17 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzOSBTYWx0ZWRfX7QVTn4qRl+L7
 E4SlDt6grT5+/UUYjlswoXcSm5TgJkR+rU+UedLJ7Z4KhfTwKY6oK/+0VlgP/ZM5J9sKmr5hjNl
 RCkrrLyTow6ivfl3gDIt8uBhIdQiEAc=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa91382 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=aw8XXKZHl-0D_llVJ40A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 40EEIreFG64Cs9QyF1ohAFYQ-5XBmcd1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzOSBTYWx0ZWRfXxQkRk1ox8ZHd
 cF4zAs/NsPngwUKzitvSgY+FWrOLQA9iEoEeK5wIj5hbb4Zvlj21Ei+uRpM9xi2DgA4awdOa9Q3
 OvOUVAJy77blLJ/gekOTLJgR506/TRY9pBhXNk3J6YqQPckF9UUsXaXGjlOSxTNM5VZ8XIdnz+P
 DOg8xh0tnPtOmSvDZoh41dLJN6nM515ZIK6ctAHHOqs6n130whafzybUyWBgbhmykVJDB86pELB
 OLTJ+2xlCJC4gGgQHTvxLvXI5dzhYRZ07/U4p0uIvTeMxO+kX335md7UwQZehi+8ieWeIZI8vZg
 Ho1h4ynEu2nKakd/1QEmu03U5E0i9TX0fJrYMIHwr656aD6mO6NPZkMz0avF6HwmXcMOcZ0z9ef
 RCLQgVeCTgHiapmR7Aq+r5gA9F5ftenNRxZulOWza62luFYWMtoA4O7o6KrZoQs36ldMnsTKZ0g
 LsEhYrKIhb22ItyCzVg==
X-Proofpoint-GUID: 40EEIreFG64Cs9QyF1ohAFYQ-5XBmcd1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150139

Hi Bryan,

On Sun, Sep 6, 2026 at 4:17=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Introducing a dedicated CSIPHY driver community feedback was both to move
> to data-lanes starting at index 1 on the PHY side and also to match that
> indexing scheme in the CSI decoder - CSID.
>
> CSID consumes the data-lanes property to determine which CSID lanes to
> switch on. For indexes starting at 1 we need to amend the logic somewhere=
.
> The PHY side code normalises the input data to register level meanings so=
,
> replicate that logic on the CSID side.
>
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.
>
> Existing bindings are not affected.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 84097d82d99c9..07b3cddca5840 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_o=
ps =3D {
>   */
>  static int camss_parse_endpoint_node(struct device *dev,
>                                      struct fwnode_handle *ep,
> -                                    struct camss_async_subdev *csd)
> +                                    struct camss_async_subdev *csd,
> +                                    u8 lane_base)
>  {
>         struct csiphy_lanes_cfg *lncfg =3D &csd->interface.csi2.lane_cfg;
>         struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device=
 *dev,
>                 return -ENOMEM;
>
>         for (i =3D 0; i < lncfg->num_data; i++) {
> -               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i];
> +               u8 lane =3D mipi_csi2->data_lanes[i];
> +
> +               if (lane < lane_base || lane - lane_base >=3D lncfg->num_=
data) {

I agree with Sashiko that a used lane index can be greater than the
number of active lanes.
So perhaps we should remove this test, or compare it against a fixed value =
(4).



> +                       dev_err(dev, "invalid data-lane %u\n", lane);
> +                       return -EINVAL;
> +               }
> +
> +               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i] - lane_ba=
se;
>                 lncfg->data[i].pol =3D mipi_csi2->lane_polarities[i + 1];
>         }
>
> @@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
>  {
>         struct device *dev =3D camss->dev;
>         struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       u8 lane_base =3D camss->legacy_phy ? 0 : 1;
>         int ret;
>
>         fwnode_graph_for_each_endpoint(fwnode, ep) {
> @@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
>                         goto err_cleanup;
>                 }
>
> -               ret =3D camss_parse_endpoint_node(dev, ep, csd);
> +               ret =3D camss_parse_endpoint_node(dev, ep, csd, lane_base=
);
>                 if (ret < 0)
>                         goto err_cleanup;
>         }
>
> --
> 2.55.0
>
