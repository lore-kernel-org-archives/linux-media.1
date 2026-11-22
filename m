Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795349736;
	b=DKaNwSYjwui7VjN6md6BNUUz0er2h4/zasKE/NNAFW4IfNe1x7yXOl+L7UHsFKnPRjNb
	 Fk4BvRMikL+CzPn2PHyK9yyu4gVdXGTW7X6PUmhozsN6FasEYEwlqlimXlTnZG6GRvHXl
	 Xtzj5DjwWSEB0cudfZIKYkoEBzi/kvuASa0HJ2ajJLgLx17Kdi6doqm1SpQA1SG0oEpCG
	 Nm3eC440fWFQIJpC1V42UFfVp6sypb9i+b7XkAgCQIqrQoBaFqtgLJghs9va6y+6TlAqA
	 +hsBEFvQsDktyzMmvMxXJGfsBFZUkDcIAn3D95ajHvpSzUCq2by6YLG8zzZsONDUV3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795349736;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DCc2S3vQ6jSV7i0N9chKSEbA2jYT502zeuF6yPEtHQE=;
	b=hVGbxd4adzKcbFm825aG114Gm5eRk+krb+rnGTGLeW+P8NLY/JhR5qCBu5F4EGJFNQdR
	 Jofn+rBD9u4NEHwePwaj4WMDyJtgX96eQpIKDmgIqON0x0QLhwK7af+1h8BTOVwnltbXB
	 X5Y4z2FTkQCHpPPSlGMj9fjoXs60DdpwSbV2BKp8dMa7HnMb5Y96iKhJloPkGFPD4snvT
	 8GNodKfoHDq4S8YEaAOUudL4YR572LJwTm5dApm+Ahmh9lhucIqX1st5451hlX9lyb6ky
	 Inzi5dDF9nzANdq9aMdzO1arBvRHIRJZ4q5kmvt/xdZFSfp+M2Ex7njraeCFAtfem1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cs6D4xcN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EB9606A320;
	Sun, 22 Nov 2026 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cs6D4xcN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B561F000C4;
	Sun, 22 Nov 2026 12:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795349736;
	bh=DCc2S3vQ6jSV7i0N9chKSEbA2jYT502zeuF6yPEtHQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Cs6D4xcN0YUaBdtbwHQpaxUx07Z2iQsj4tIDbVWdPhcIEqlV/Tn5uUINhKUtQcaPC
	 0e4sT8lc1xRx7hCSU7VX/1X54M+ExPRGff/rDMl68JM9r9ceewoF8Kv6gQrq4lPjMT
	 +R7nvmB08JcaEDD7hf0sGvTeGC1nU/TEeQmRD4xzsAkxJfIMgsnXQU50kAmWco82zU
	 hA1RhfUHDbKAgw7rdtiO1xdkaoUwjvJiEDWXnmlsWh172svhXdW9P8yKw2hbIcSZSl
	 gmiMnesiuiEg+20TC1cuuRZi0VuNRDlCpRkYlwnrR3Md0d5jMmk8z3zwFe9E6iopQy
	 9fq7kTnUZf18A==
Message-ID: <96aff3fb-7a7a-4922-a18b-fa44f67d3655@kernel.org>
Date: Sun, 22 Nov 2026 12:15:31 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,sdm845-camss: Add
 interconnects
To: emcp@enser.io, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261122-b4-camss-sdm845-icc-v1-0-0671ef770fd0@enser.io>
 <tFRov2FDqtwLChjesvopeCKdv3y-agN4MN3wt2SAzqj4EbYaUAu3C_eTFQ2FVdYmvK9GOSJ75_pKuHQOZnCA6Q==@protonmail.internalid>
 <20261122-b4-camss-sdm845-icc-v1-1-0671ef770fd0@enser.io>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261122-b4-camss-sdm845-icc-v1-1-0671ef770fd0@enser.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 05:13, EMCP333 via B4 Relay wrote:
> From: EMCP333 <emcp@enser.io>
> 
> CAMSS on SDM845 reaches DDR through two camnoc HF ports and one SF
> port, and its registers through the config NoC. Describe the four
> paths, named as in the sm6150 binding, which has the same two HF ports.
> 
> They are optional, so existing device trees stay valid. The driver
> votes on them where they are present.
> 
> The code and this changelog were prepared with the help of an AI coding
> assistant. The submitter has reviewed both and takes responsibility for
> them.


> 
> Signed-off-by: EMCP333 <emcp@enser.io>
> ---
>   .../devicetree/bindings/media/qcom,sdm845-camss.yaml | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index be09cf3a3b..8c87ecd406 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -76,6 +76,16 @@ properties:
>         - const: vfe1
>         - const: vfe_lite
> 
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_0
> +      - const: hf_1
> +      - const: sf_mnoc
> +
>     iommus:
>       maxItems: 4
> 
> @@ -233,6 +243,7 @@ examples:
>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>       #include <dt-bindings/clock/qcom,camcc-sdm845.h>
>       #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interconnect/qcom,sdm845.h>
> 
>       soc {
>         #address-cells = <2>;
> @@ -337,6 +348,15 @@ examples:
>             "vfe1",
>             "vfe_lite";
> 
> +        interconnects = <&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +          <&mmss_noc MASTER_CAMNOC_HF0 0 &mem_noc SLAVE_EBI1 0>,
> +          <&mmss_noc MASTER_CAMNOC_HF1 0 &mem_noc SLAVE_EBI1 0>,
> +          <&mmss_noc MASTER_CAMNOC_SF 0 &mem_noc SLAVE_EBI1 0>;

Ah come on. "The LLM made this and I reviewed it" but this is what 
sm6150 upstream looks like:


             interconnects = <&gem_noc MASTER_APPSS_PROC 
QCOM_ICC_TAG_ACTIVE_ONLY
                              &config_noc SLAVE_CAMERA_CFG 
QCOM_ICC_TAG_ACTIVE_ONLY>,
                             <&mmss_noc MASTER_CAMNOC_HF0 
QCOM_ICC_TAG_ALWAYS
                              &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
                             <&mmss_noc MASTER_CAMNOC_HF1 
QCOM_ICC_TAG_ALWAYS
                              &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
                             <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
                              &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
             interconnect-names = "ahb",
                                  "hf_0",
                                  "hf_1",
                                  "sf_mnoc";

Please _actually_ review it, the patchlog even calls out the source yaml 
used as reference.

> +        interconnect-names = "ahb",
> +          "hf_0",
> +          "hf_1",
> +          "sf_mnoc";
> +
>           iommus = <&apps_smmu 0x0808 0x0>,
>             <&apps_smmu 0x0810 0x8>,
>             <&apps_smmu 0x0c08 0x0>,
> 
> --
> 2.47.3

