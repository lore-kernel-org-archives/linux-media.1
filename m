Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC9E47F3BE
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856882; cv=pass; b=ChqhpJDEDQzxSG9FTacgcPIEDHylgLTtedbVDz1pfSnAROwl8VZQLlpk+klFmIBpgCr/xncEUnnyxORyDljXFSR+1gmyez5tU+sg267ACblJHY1ovvVdyKV6KTFQ0P/5JEpQ+Myog5RZEi1gXORx/yYXJH8XizL3LZ1lLvngjB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856882; c=relaxed/simple;
	bh=GQ+mO9FqZTwGcpM6upiyjFp46GJQt7lNaQI6Ua8Mn+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bt4mH5P/QG4DVrSDQLjRnV8GRjtD5OkJIfdjiZq1f+1buGQgCmvP1pkn9xGk0HT/6dGrqUAuJfx7Uyrm1x6/aO2hAs71jujUYDVBiuG2F9GvUMG/LpovyYkt+k5HTDUg8E7/Qat3wYMbSV9P5eUK0nDeVpZOdc0yc1fZQLym1iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ix+QKi5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlQHtxDK; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ix+QKi5q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlQHtxDK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xnL8396309
	for <linux-media@vger.kernel.org>; Thu, 1 Oct 2026 12:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=; b=Ix+QKi5qPV1KtdYU
	Fd25b3ki3mnYwBCEfyyo8hdnic98d5QIh6iuvE6YaWGQ5wyjxfrRUAtvFXTy19dR
	rciV7KX7QI24gLaKN1mcP2EKic2w47fzakCeYc7x9r0OAjhiu0zuewMAp7rCOJfm
	PK2uj6B38BTmvItLU4ryTowSYZxZ0iaaMokEpxDNVywufMAGE0aXRWrUIBx0j3lU
	J9fs4CYlvJYIlrwm0y9UTz5vf0uvZPnMnYQxXS2pdmx2tFzw9WfuKT6wK+c5e+7O
	azYNBplUrf1peMWraTpwUdfDTrMB2j0fkv2CM4MsUiAdPa6hXZ6gU2IlgUXy0bMJ
	etfVfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5aukb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 12:14:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso209505885a.0
        for <linux-media@vger.kernel.org>; Thu, 01 Oct 2026 05:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790856879; cv=none;
        d=google.com; s=arc-20260327;
        b=Yff/bSOoI94glYO6xnRqc4e7pFuGQ8lBEGJF071WWWNufsEfmX5/8b5Y33J4QfZZ1Y
         4XRP0HYlM7B6Qsn9+uaEgbPsnUJL1GBoHVx0GIQG+a/zXy7dY6VPZywpA52Drp6rREhT
         0NOTsw6ThH6lndPev5mgUNjRdzPOgSkIelNAbH11MZpxOIC1DBgeE8XrICeUR4BNLU0O
         O7ypm7NLtXa5jVLsXAFjxa5J+of7GjOsiiA62G/Eh3qIAzeGuBF43UbZ24Auk5UYFjjt
         eQYpdZvL5Ny0OSpLEf7cmw+wclPURv7iPxpv1ygA8BO/QGBy4MQpMcQltNNje3oO2b1s
         eWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        fh=2mepBmmDaMBa/BnxD4kOjtsrIk0Ho8dzcboAZ6yflPU=;
        b=kBEcKk+u6DOjHLmyfyVQZ7SQrog/6SAtXd2aqeKsHYn7BkuIhF+9SgK1yxWFKOBJi2
         SKvMNeG1PhmKZiDSZ+6l4Nm1oKUe/9k1rEegyKMNZiOcQ/fBJwcDXuksoRtv67nKtNeQ
         AxPB1DfojUEwKul6l5bt2c6AGnBm6yhfFEAEBYVx6z0ASftkv/DFCKUseljNtJZW4i0I
         Ay3hqRd+ix3hryeN2e9LQdMN5b6kVSWrt7dgdS8RNafFU1WquiwFrlhoupzbcMj7IHrw
         KfKiwtZxEu5p7ZnxCNX0OvfalCD7BRrwssUCWfhJW3f4BSh0pKzz2ke2bTtNMQk3oQm/
         C0xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790856879; x=1791461679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        b=OlQHtxDKcClYMz+IKTZhtkY7f8CV8ZlvY9r+Ok0FRDFFGbVuW0QWmGmtg1x2CU7Zo6
         18Hv0CLA9GNZCfrLrJMFU3nxJy5B9Ev40h91vKTd7sujWw6/nIm3+KA5NV/nBmKGfdXR
         V503fqYemLQ/zRq5WSRTvRoW2jvSjPBdsIz0NfOUNA9R/P6EkOXCHv7u5uE2JhwECJjC
         DOm28ZeCtglbk+g0ZTLj6N3N5y2O+iIUSvoHUxcffREO1Swbrt4q7UyK9H/rnrg12B81
         bhN6HKfHAxSrlKfM79qDbHayUh5/bSCtAd1Z09V0PkL0JKmOz+BzWLvKBQEs8oKzN87l
         xoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790856879; x=1791461679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        b=nWj4iZGLYkmO++53wfgP4mKSfx2QbmAt0HK/YYUrCrCY5fh6Nplq0sLEn/vw5Oyg7a
         X6rl1eUKeAqcGhMfW4WQyoI3lpQUiGDwy3ZS5VRcgg3hKF+BfhkP0z34DQyFcd0LOY6y
         gdVtdZ5DOc4wkr1un53wigTYEtGL4utUc0g29x5d8lO6P/OCriwJD9tbtJy1Ol17sr9o
         F4Qp2NWtnifRRoFi0BSMDbPWH5BZ3fDFhQeoMOyfzxirAE+leUzVhosOI521eA3WgpHl
         6oO0mzWHPfvqZ/EaT7jEzNtqhJY28uM426RGNePPV7/OfR/qEFsihH/b6igzcGkpetQM
         pqHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNby5+CXhk1X6pnG+l6Y+Ta5224bP4eSqjGZnTu+qlKa8RHUTUyVBOa4XdHGLM2RW46YcOdqw8LOgxiQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m4gGDBV0QuAPldKS7FN1EyALUHVCvtV26f6Pl9zZQNc0HLO9qY
	dP+QsDOIEH65NGq5xSvPHjtHyYSPxT/IYApnWSbmINbnt3r4C8TCl4NDN2dnXFKWQ9ZbFuesQrB
	7M28YNWjqbPX9XAiJQHEWAGosQoBjXJR4DYeL9vRzkCLe8wr9neQYEtR+a4572D58JyGhi15WVW
	J4+0ntrV+0Sss2qy7lJteGwlOs8WLbkEw91uowXK03
X-Gm-Gg: AYBFou0IV5ee/WVSi1tNjv7nrKf5JSA5ImgrYRVydeMU62N1O5gUbrENubYAAb4Mvbs
	f4AR74URsoC6m1jDFE6fJgEQfDLGtwxTA0wDMOxxgu75Yqq4gn2pYuUSrYRpdDlE1MMLyABAojP
	ep2o8xOHMsZmA0u2aogptzxpedydP9Q2jbj6aTPz/hY3Sxy38ZPDXYFTKhOPDe7P7/MsYohXxnY
	4geKiw0q3O0//q8FbGzRIkOvv6PFnNEG87blD++A/u9t+XckQw9W/C3/xO0RBbfkXPGEBPS8IcH
	kJbdVqo5m+Sd/Fxn9sD7nbUZCXgD
X-Received: by 2002:a05:620a:40d2:b0:93c:bb1b:b6b7 with SMTP id af79cd13be357-93cbb1bbbaamr275241685a.12.1790856878472;
        Thu, 01 Oct 2026 05:14:38 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93c:bb1b:b6b7 with SMTP id
 af79cd13be357-93cbb1bbbaamr275234585a.12.1790856877804; Thu, 01 Oct 2026
 05:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com> <20260923-hawi-maili-camss-v1-1-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-1-cbbb42e534ef@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:14:26 +0200
X-Gm-Features: AclHuK_XuSX4ZePWnnpee2tgGkBBnS3UvugT_wZeMdgt7PGi5qaYm1CjHnboJlg
Message-ID: <CAFEp6-1Zvt0hhBd7LNx2hsyi9J+bxCT8EWN3jZ4B30SO58SCow@mail.gmail.com>
Subject: Re: [PATCH RFC 01/15] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0OCBTYWx0ZWRfXwGQd6aWcZ4k7
 k5qCQ7TKzY6UMZ05P3ZWIHQedmwEcH9YgGSYd8Ni6K00CwSNkgLO2zXxSaxlLlwZszBN0X5ZFFq
 SrNN8yL+cviB7sWHdHIEiRScSo6dOwIH0r9RTE2ap37WenPvFmDcIxDEbOU6DaJw59fO12ACHWj
 3aGPbHVirGhC3EMgE+P3qAWxxdFBM1+ARkzjUJvFfQHnAKfVYjQnWeX1QsVBYn7xuVrtum8e4TH
 kqcTKFhMQfV7qSOvUpnSWJeq4MCjhG/JdXG1ou1jUcVLtKebCH4sojE8PAE0u0K+VYt7CNPBH6O
 f4IQ5lnANR01/TYrgCmwsyeSGZl68gK1xzJg79/eWtmKwgUYjop2ngbbJhYohuCOkHZXHuwan2P
 CnaJpfhZpgD6xF4TBELPsOA99AQ2X/fYVO9nTrltjWOKItRbN7vlzxQkYeZ9z81ss6ctVbIWr0c
 JKnEwS2TIWWAVgJVqfg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0OCBTYWx0ZWRfXwJZWRSjMQTU9
 zz0cJ6UzMixjx0Ez1B64P9jHIwJkRzprtoESXS+Ei3gLVOLWPnfoLJ2Pc7ZeyEGOStV8plp6R4/
 hghewb25ILUDNoYtRMgNQtuvm0ZPymw=
X-Proofpoint-ORIG-GUID: 34xz8mEhvkqE-suIQvUJNOSsGcBY7-mr
X-Proofpoint-GUID: 34xz8mEhvkqE-suIQvUJNOSsGcBY7-mr
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe4eaf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=R4gLiKe44IeHqeJXRIIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010048

On Wed, Sep 23, 2026 at 1:02=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Document the Camera Control Interface (CCI) compatible for the Qualcomm
> Hawi platform. Like other recent platforms it requires two clocks, so
> add it to the corresponding clocks constraint as well.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c8=
73bace1764fb3e3 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,milos-cci
>                - qcom,qcm2290-cci
> @@ -137,6 +138,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
>

I think we should stop falling back to msm8996. These are newer IP
revisions with additional features and resources, such as different
FIFO and queue sizes. I also plan to submit packed-write support soon,
which will rely on those capabilities. It would be better to add a
dedicated variant entry rather than reuse the msm8996 definition.

Regards,
Loic
