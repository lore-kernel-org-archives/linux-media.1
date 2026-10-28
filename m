Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793205390;
	b=22Wrv1LXTQvMJFdAegtINUfSDkhhTspkYairFfMNpTzneF1HV+LdvZRxTfFI3FNZzAJk
	 v+4GZeaOr0voCvNSHrVcOdHhbTaydV6AnGSpVPuwTWjUmBMAZdKhnq/tJTAuv8SQUHVJf
	 mKIqdMMM8bi9WTqtoo/Qs24dR6e0W8Yg/YTDTapvAZana3S39Pjqq6964SAKGD/wMj/6C
	 n0oa8Kzh7oOp+5oce6C10ydFt4zVyqulCqNAbvYsx5cj4f2JfbmsdN+NqoNzarol56pwM
	 2okLO9Zdverb+jSFjc1YmZaP0I8qpGBzk/38nSrt96u9JxLoCcfl0rFEWHZhKKbe3fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q5t3Rh9YkGOdmO6RznnXKL/OB+E6bNdFE1taktSfjrQ=;
	b=Mbg7lIhQwjnhuQVG7H6d/oPZjOdUlq3ZYA5VB7BTgTN0rZkhEk0rVslYI1U79150wio2
	 WqgkEIwJApNixY+wsa/WtK1X7ugJrrrMap0TuRy7yN3PByZr/1vrkN2DNpKgsZKqQZyZJ
	 dxGjsP4SJS4/FRDweUIEh3sk/LrTvcBsOmlSqtrRRaW4Zwple1enW1NMN+djcL9ZubvU+
	 trRwFTFxDfJek5lK1dHeZiTdvZ+dxTuvSCHjGDLBjy94GGHAG43ITOsRoCbayQW0SceKo
	 4OMK/5gS4OnqLEAhhX5sdS3GeAp9jY3sfE1NwMN2g4i/ay8VQS09B+F8eVajiQOw4Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOzzyruz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eaDKKqAi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F9606A330
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 16:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 080F9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOzzyruz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eaDKKqAi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA4og1471855
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 16:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q5t3Rh9YkGOdmO6RznnXKL/OB+E6bNdFE1taktSfjrQ=; b=cOzzyruznl/3f+kd
	dF8gHc4ZnOyeaQuF2Wzu+i1zbM2sU17jP2pI56YSWaZCcndRivqpYnA0iUAF7t5R
	dR4koZyQ7itVu6aj1uhpT5IclnlqeqgIUaqnfh06ic7KoVCQLuUXSg+F6neRTUpg
	kJOqf99d1xlzYx5FxsO//GZMilHJvro/YNXBLW3h4yeCTXxlI1qd1ctEhF+vQJlZ
	8WXxQ19Ajyb/ZHNqXsa8wYI6oC8hR4bbBJr7hdQYpQh957PukZDYaXLKDTgZdcml
	3KMJjQ+hURRL8V4vbToS2yodWc4Tmgr/D+gm8enyenPi3XNO/L37vYWIhvhyV869
	hy7VDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkfehhgxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 16:36:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so187886385a.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 09:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793205387; cv=none;
        d=google.com; s=arc-20260327;
        b=FmeUGl9auzWWSGQeKRYQjpmpHE+8ZKid2dgPQ1TUIP5n48LE3APKxZmm0VEgl/o5Ef
         UTWzanoaNl0rG/3aaBnnJvMqGUvetZ+5Eo2wCwp0Lgf8cPgLwnVMWYqWV0pJDZ9aDBKc
         B9Qh+pBowjXyAYQdXAIyeJNZ0Y8GT+Ll7eD0iM4Uy1/VHWrsD3z8ut7b1OykyGlq9MWg
         uh5NY+3Lh68Id/5uPxdEfbqi8G6jZN2sDoegH/DF7CiUT5bFX/Rtfmld+sDyUIhuDP0T
         1i2Id2zf64PKCdQNJ0AQlyv6OfXLJYeuUudsSi5Lv8zDO31eFmEhPQpb1zrcnNLFc3Ik
         +mXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q5t3Rh9YkGOdmO6RznnXKL/OB+E6bNdFE1taktSfjrQ=;
        fh=ZVvXYtbwNXInd255kENNe6yoh+qL71piKCvDcXVwS1A=;
        b=IqLN98Pu86v8zDuDdrY3m8YTp0WXidaHnJe+VhJa4v3965pEJG4HglcemwcR8aq99r
         sLmXEPTc7aNje9ivsjXsp0yOx9VBBZna51bQiYeL5PgSpOvNNbs5M4fNzRxjAtsJsgKw
         FJJ0DBBs09hiagPYxng8AIFe5glRVjipumW8TS9w6JUI1Y5pMP8OjUzAk/xsQteK2ygB
         /FGmeVCviyhBfl942Tm1gFnKi5Z1hqfUJ5MQuIi8mCNu/sHcO5oqLPXIap8iFVHNIMog
         ldkRzwd76vx+3XdMXTGlqYZaXgqsiPLjB4/vBFGhwf3WWTLZXHTjYMiLeaBLTKTywDnJ
         uv/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793205387; x=1793810187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5t3Rh9YkGOdmO6RznnXKL/OB+E6bNdFE1taktSfjrQ=;
        b=eaDKKqAimoKXzHBvGTzw7/eOwOWxuwo+uodnhWumVpLTcMvC0z7hPY4+8GOhZMS3aY
         X+FOFOqViaAYip5I+8xuA9fdDrMsPakSPJweijA+fZLk4HzoK5kiwgsxFZHKltcz1+H0
         tMJHPAIcozBFN0B/DtXTsW7iK2jR1tQp353mLWouz7AHAr2FAF2F9cFR2rNYufyKYkCz
         Pd0tIXOIeuYacYZiB2XhqNtiuWXOTpdfruQ8+UxoOj5vXrPVjOMW3TahOnR0k/qkWxG2
         HsoTunswRH7ubdGN5LFtml0WmTbgzeqXiKOdXkFIbSj6RU8H9t9GNb6kNUbn1mGeuRPk
         YsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205387; x=1793810187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5t3Rh9YkGOdmO6RznnXKL/OB+E6bNdFE1taktSfjrQ=;
        b=dADjGP1HT1mVQeXT9Fa9YesZ8sAD7yJuAFRopDIWvuRsDDYx0T+mZLpiGqeyTPspft
         kkH6ppRmkNuVvk2p+LI8ygun6Wrvwh0Acm354BXdNmRVs0p9XgDFZGITNZFSCwqzDd1X
         b1DTDVnuAXrMv9zDiP60Hq/ghU4kwA6Fxgu48xG0xagujPPloN3zXl4WpP4SgfaXRXmq
         qPeKs98Rq46ALjxD3rxdxW3YE7fJubQRg7k7vQRZF7C5C+mPjE8yhSbeQsXLBcom9j1N
         OVYBuDiIenolPashCvSMPGEhNnNnGA6hfWEAUjZ8feIa5tXyWEqYQnt4IvnWFzzhx2YI
         VWQA==
X-Forwarded-Encrypted: i=1; AKwUvBxEHiVzB0ZbPgaGp4x/7Xqi+B9ZUfn0Q6KJVf5iO4RqP7wzlR0o8v85W44Lb6xEMxZ0qWpymTjacHKJ3Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKZfZ0MKVdc31YV5nUapUqLl380+kESE1l6nSf4b1mq5tXw61Lp
	FLeUwPdicJiBehibvCq/7df9pgM6vsHh8pjJPcHwcv1zTxXgaX62sOpsP6FPVHCRmOnw5heYFqp
	FOdAi/EaZetzQqeH7yL9y9qEMYP1Eg0PmqkrxpO0gPLWEgF6yMaBC4V88DNFjLX6vbXDrU46HQ5
	JasUATWTONCHyKHZoSpQhNIrhXXAaHw+zn5Td4vOvb
X-Gm-Gg: AYBFou3GkPsmbQYn8pjNIpuCYgAuar5jJfy4uU20Vi7Lfo7FOfF6v5DL+kxJ38o0t39
	AyqAN/kfAI0FHO0acAPztgU3hmScnfsu6pY+XOHjM5AknVaan8OjCuyEuxheZcsTdik8Tx8oq4f
	FE4Lpn2eXf+EEkkHNUSvDkF2J0WSCh7zUsNgsgi5KlsKIr6rBu+ffcl1XyWgX7g06LGmfdZr7cs
	Y/OQuadZc9310jFCnmrNeoAV9ojPx+8trd6FC6ePPIiMqDSi3EsGJV2L/Z3q7iRuSBADidl4yLb
X-Received: by 2002:a05:620a:46a6:b0:93f:2b23:481b with SMTP id af79cd13be357-94408aa219dmr459954585a.22.1793205387000;
        Wed, 28 Oct 2026 09:36:27 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:93f:2b23:481b with SMTP id
 af79cd13be357-94408aa219dmr459949185a.22.1793205386506; Wed, 28 Oct 2026
 09:36:26 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com> <20261028-kaanapali-camss-v23-4-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-4-95f250b18612@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:36:15 +0100
X-Gm-Features: AclHuK_qZnIsa3_FMMHTiw2iXEoQpzgN5rjHWMbnvqMU6BVIbLYMNtYuWHeQqVU
Message-ID: <CAFEp6-1QvF+=XQQrdDQS0kM8f1zoz3s3MZECOOdmYjAaJeBZQQ@mail.gmail.com>
Subject: Re: [PATCH v23 04/15] media: qcom: camss: Add addr_update hooks and
 guard CSID reg_update
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
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
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NiBTYWx0ZWRfX4xVo7IfMKcCF
 JuiHQBjbtPQxBS6Rlvb6cOP3kxmhvZn3L5NNI/BjKYwy6Zh6obhk28HK+TU8alu8qGsHdKgrhEY
 iSM126dDFd2wBJQ423PbUegfDUWL9O/tnND+qpqxDDGDSTEJ/lDZ4lYBO56lyho4oOjE4RrFc2r
 te3L6pArB7UmtDaokqPysjiMDYphbO61SwOoD0SN+HpVxcCqED9Kc9KsyCxCmJj2rPXVIeoW/Bw
 Up8w2NEDsC+OqgUIboGPatxiuAHBheXJ4ACo69XM3FN7Ytj8BmcxPPHjX7iyT55RTJOZSoRcQOO
 KZva2QUa+FfGaz4OJv9y/Umg86U6qdOoNf6O70MR8W/ySIvHH+/OdSIcG3icH8EgSqqERT/XO+m
 IckVX/Mt47sdDdgPQ7VVWL63Z+kb9nAFjbbpyAhuiSzj7xCJVeVUFbIKJrm5LqoIOmyOKsIqWgM
 vsnBcPdLwq/2waH3wjA==
X-Authority-Analysis: v=2.4 cv=A/T5rKWG c=1 sm=1 tr=0 ts=6ae2248b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=vOQjydwpf4klcLd5GhIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _ieSJplx8QmEpVB33UuHUlPxYjCzHnGR
X-Proofpoint-GUID: _ieSJplx8QmEpVB33UuHUlPxYjCzHnGR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NiBTYWx0ZWRfX5h8ZOKPqN2Pk
 Ma33w18T8uy0EOst6rCbHwFZFCK1Tx8u2hStc5DarXWDgbga3naQCNCWIjhJyMw0ow64IXlviRg
 nNAgai/6S2ygcRcmB3RETy3sSNa49tk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280066

On Wed, Oct 28, 2026 at 4:21=E2=80=AFPM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> From CSID 680 on, CAMIF was moved into the CSID and the CSID became
> responsible for issuing RUP commands. Starting with CSID 980, RUP and
> AUP are issued separately, and each command must have its corresponding
> SET bit asserted in RUP_AUP_CMD; otherwise, the hardware ignores it.
>
> CSID 980 and newer require a specific stream-on sequence. After the RX
> is configured and before the RDI path is enabled, the CSID must first
> issue an AUP and then a RUP. A RUP issued before that point would leave
> the VFE without a BUF_DONE event. Therefore, once addr_update is set,
> the VFE must skip the initial RUP during stream-on.
>
> Add addr_update hooks and camss_addr_update, and make camss_reg_update
> handle a missing callback safely. The VFE keeps issuing its initial RUP
> during stream-on and behavior is unchanged if nullify addr_update. The
> skip takes effect once a generation that sets addr_update is enabled.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid.h |  8 ++++++++
>  drivers/media/platform/qcom/camss/camss-vfe.c  |  9 ++++++++-
>  drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
>  drivers/media/platform/qcom/camss/camss.c      | 15 ++++++++++++++-
>  drivers/media/platform/qcom/camss/camss.h      |  2 ++
>  5 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac..2f7e593defed 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -137,6 +137,14 @@ struct csid_hw_ops {
>          * @is_clear: Indicate if it is clearing reg update or setting re=
g update
>          */
>         void (*reg_update)(struct csid_device *csid, int port_id, bool is=
_clear);
> +
> +       /*
> +        * addr_update - latch buffer address update through AUP
> +        * @csid: CSID device
> +        * @port_id: Port id
> +        * @is_clear: Indicate if it is clearing addr update or setting a=
ddr update
> +        */
> +       void (*addr_update)(struct csid_device *csid, int port_id, bool i=
s_clear);
>  };
>
>  struct csid_subdev_resources {
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..4f8867daea4c 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -487,6 +487,8 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>                 ops->vfe_wm_update(vfe, output->wm_idx[0],
>                                    output->buf[index]->addr[0],
>                                    line);
> +               if (ops->addr_update)
> +                       ops->addr_update(vfe, line->id);
>                 ops->reg_update(vfe, line->id);
>         } else {
>                 output->gen2.active_num--;
> @@ -525,6 +527,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>
>         spin_lock_irqsave(&vfe->output_lock, flags);
>
> +       if (ops->addr_update_clear)
> +               ops->addr_update_clear(vfe, line->id);
>         ops->reg_update_clear(vfe, line->id);
>
>         if (output->state > VFE_OUTPUT_RESERVED) {
> @@ -552,7 +556,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                 output->gen2.active_num++;
>                 ops->vfe_wm_update(vfe, output->wm_idx[0],
>                                    output->buf[i]->addr[0], line);
> -               ops->reg_update(vfe, line->id);
> +               if (!ops->addr_update)
> +                       ops->reg_update(vfe, line->id);
>         }
>
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
> @@ -588,6 +593,8 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
>                 output->buf[output->gen2.active_num++] =3D buf;
>                 ops->vfe_wm_update(vfe, output->wm_idx[0],
>                                    buf->addr[0], line);
> +               if (ops->addr_update)
> +                       ops->addr_update(vfe, line->id);
>                 ops->reg_update(vfe, line->id);
>         } else {
>                 vfe_buf_add_pending(output, buf);
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/medi=
a/platform/qcom/camss/camss-vfe.h
> index ae9dad353a37..8312e4c91e98 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -99,6 +99,9 @@ struct vfe_line {
>  struct vfe_device;
>
>  struct vfe_hw_ops {
> +       void (*addr_update)(struct vfe_device *vfe, enum vfe_line_id line=
_id);
> +       void (*addr_update_clear)(struct vfe_device *vfe,
> +                                 enum vfe_line_id line_id);
>         void (*enable_irq)(struct vfe_device *vfe);
>         void (*global_reset)(struct vfe_device *vfe);
>         u32 (*hw_version)(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a..be58a39f4a8b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5049,7 +5049,20 @@ void camss_reg_update(struct camss *camss, int hw_=
id, int port_id, bool is_clear
>         if (hw_id < camss->res->csid_num) {
>                 csid =3D &camss->csid[hw_id];
>
> -               csid->res->hw_ops->reg_update(csid, port_id, is_clear);
> +               if (csid->res->hw_ops->reg_update)
> +                       csid->res->hw_ops->reg_update(csid, port_id, is_c=
lear);
> +       }
> +}
> +
> +void camss_addr_update(struct camss *camss, int hw_id, int port_id, bool=
 is_clear)
> +{
> +       struct csid_device *csid;
> +
> +       if (hw_id < camss->res->csid_num) {
> +               csid =3D &camss->csid[hw_id];
> +
> +               if (csid->res->hw_ops->addr_update)
> +                       csid->res->hw_ops->addr_update(csid, port_id, is_=
clear);
>         }
>  }
>
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 7dc2fd9f03e0..431afeb381aa 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -182,5 +182,7 @@ void camss_delete(struct camss *camss);
>  void camss_buf_done(struct camss *camss, int hw_id, int port_id);
>  void camss_reg_update(struct camss *camss, int hw_id,
>                       int port_id, bool is_clear);
> +void camss_addr_update(struct camss *camss, int hw_id,
> +                      int port_id, bool is_clear);
>
>  #endif /* QC_MSM_CAMSS_H */
>
> --
> 2.34.1
>
