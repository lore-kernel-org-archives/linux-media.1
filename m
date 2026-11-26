Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713495;
	b=d8rls7PIH90HaqqGkFIYCtciS524YjNmeO65KpYZ5RTuqYuErAtvEhY8JpVPfRgy/3Lh
	 2hBxiQB8Zq9wQYDO0xcxqI2Ufdsxx5ZSJhYuz8JSu1ysail6I0gIXZyYk+sQyF1gMib25
	 n+3T0fY53hAgXJBp//w/ijTEj4KfT3CvS93guN7LBwX3K8DpHKVNunCYIQ0b4gxtpEWCo
	 ZkM7vpQld84WIbo+qAIjGyCk045zYSYFiMm1/y2TOJfGWxQ84UCS7EajMBVQ25XA7IUr9
	 /wYQtHTV54I2fDDQVeTKWpgDo55fwWr9P6WfOOj/MaPK47XHZizKXUIA+BlzvisDmeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713495;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=w120dgf1qMRFAFrYxURhT9tSBYAzmjIDKW2aCCxepAc=;
	b=zEQ2g5CRJN4uQtqV/9l7IuQiIHDG2LxPPAqWlkdnwZfrWDIA4WssevFRME0/IlLWuY8o
	 JzwkCOdY2Cf4TzgYLE1t/2KoPy8A1M04+4My8mwK3ooVMedk55qzPCG9J5IBR4qxU/CPb
	 JKFNSZC8PV/I29XCIGM/Uvv+CNPWeItFeoSTpM1F/TOOxwaUn2BrXPM+5vc0/CrPSzooq
	 gLA+nlcDbxoT9UiLDDD4m6GbpMhm9/essbXbO/oaI131lrR29vW4llr657EMY59M2gceW
	 C//a+4co+dh+IErDyFwmsLRyTG3ggUAbgjFLKXjZe6LtJV08qB8mEcTnQd/A4LstKhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XzO1tZYj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978BF606A31C;
	Thu, 26 Nov 2026 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XzO1tZYj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EBF1F000C4;
	Thu, 26 Nov 2026 17:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795713495;
	bh=w120dgf1qMRFAFrYxURhT9tSBYAzmjIDKW2aCCxepAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XzO1tZYjiMPl4BGrk8KrL+KedwziwSVuMmV+ZcK6UWWD/SFo34rD0ym72unn4a34F
	 GhIDKC2wJIW4lV2uUOEjWk5u8vTOy7QnwkB3y3FUnX3ZLdSGd8ynAzfHaOTDhpW+27
	 0wV5/cngIYB6ORRltU7V8PgKotB/+vbOb2vrCvfEsdlN+sCx8d5QeKNRqsn0syBphR
	 MfOYuqEUEwULC2DpVJuAzXATLbFq6sA8H8cKz5/0VuX4XLDNB+RcEGlOj17xmL52Hy
	 QETWCIsQqgKg2XoGo4H9xLHIBEaxv7XXJ/TER1JsXUuRWJ5vqyLsXQyZq4em7NwP8k
	 OTDl35OH6mmdA==
Message-ID: <54eeb70e-e7d4-4f3b-af80-8b9da48ec7b0@kernel.org>
Date: Thu, 26 Nov 2026 19:18:08 +0200
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
Subject: Re: [PATCH v2 4/7] media: qcom: camss: Add SM8450 CAMSS support
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-5-vz@kernel.org>
 <auIVQNdHp91xwzqO@lizhi-Precision-Tower-5810>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <auIVQNdHp91xwzqO@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Frank.

On 10/28/26 17:31, Frank Li wrote:
> On Tue, Oct 27, 2026 at 12:49:54AM +0200, Vladimir Zapolskiy wrote:
>> Add support of the camera subsystem (CAMSS) found on Qualcomm SM8450 SoC.
>>
>> The CAMSS IP on SM8450 contains:
>> * three CSID and two CSID lite, which are supported by CSID 680,
>> * three VFE and two VFE lite blocks, which are supported by VFE 680,
>> * three CSI test pattern generators, which are supported by TPG Gen1.
>>
>> Qualcomm SM8450 CSIPHYs are supported by the CSI2 PHY driver only.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
>> ---
>>   drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
>>   drivers/media/platform/qcom/camss/camss.c     | 236 ++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss.h     |   1 +
>>   3 files changed, 239 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
>> index 2680a9914765..8ebd67bd9b2e 100644
>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
>> @@ -350,6 +350,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>>   	case CAMSS_8280XP:
>>   	case CAMSS_8300:
>>   	case CAMSS_845:
>> +	case CAMSS_8450:
>>   	case CAMSS_8550:
>>   	case CAMSS_8650:
>>   	case CAMSS_8775P:
>> @@ -2010,6 +2011,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
>>   	case CAMSS_8280XP:
>>   	case CAMSS_8300:
>>   	case CAMSS_845:
>> +	case CAMSS_8450:
>>   	case CAMSS_8550:
>>   	case CAMSS_8650:
>>   	case CAMSS_8775P:
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index b0d60e70e4bb..1db66976e51b 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -2967,6 +2967,226 @@ static const struct resources_icc icc_res_sc8280xp[] = {
>>   	},
>>   };
>>
>> +static const struct camss_subdev_resources csid_res_sm8450[] = {
>> +	/* CSID0 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csid", "csiphy_rx" },
>> +		.clock_rate = { { 0 },
>> +				{ 480000000 },
>> +				{ 400000000 }, },
>> +		.reg = { "csid0" },
>> +		.interrupt = { "csid0" },
>> +		.csid = {
>> +			.hw_ops = &csid_ops_680,
>> +			.parent_dev_ops = &vfe_parent_dev_ops,
>> +			.formats = &csid_formats_gen2,
>> +		},
>> +	},
>> +	/* CSID1 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csid", "csiphy_rx" },
>> +		.clock_rate = { { 0 },
>> +				{ 480000000 },
>> +				{ 400000000 }, },
>> +		.reg = { "csid1" },
>> +		.interrupt = { "csid1" },
>> +		.csid = {
>> +			.hw_ops = &csid_ops_680,
>> +			.parent_dev_ops = &vfe_parent_dev_ops,
>> +			.formats = &csid_formats_gen2,
>> +		},
>> +	},
>> +	/* CSID2 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "csid", "csiphy_rx" },
>> +		.clock_rate = { { 0 },
>> +				{ 480000000 },
>> +				{ 400000000 }, },
>> +		.reg = { "csid2" },
>> +		.interrupt = { "csid2" },
>> +		.csid = {
>> +			.hw_ops = &csid_ops_680,
>> +			.parent_dev_ops = &vfe_parent_dev_ops,
>> +			.formats = &csid_formats_gen2,
>> +		},
>> +	},
>> +	/* CSID_LITE0 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
>> +			   "csiphy_rx" },
>> +		.clock_rate = { { 0 },
>> +				{ 480000000 },
>> +				{ 400000000 },
>> +				{ 400000000 }, },
>> +		.reg = { "csid_lite0" },
>> +		.interrupt = { "csid_lite0" },
>> +		.csid = {
>> +			.is_lite = true,
>> +			.hw_ops = &csid_ops_680,
>> +			.parent_dev_ops = &vfe_parent_dev_ops,
>> +			.formats = &csid_formats_gen2,
>> +		},
>> +	},
>> +	/* CSID_LITE1 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "cpas_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
>> +			   "csiphy_rx" },
>> +		.clock_rate = { { 0 },
>> +				{ 480000000 },
>> +				{ 400000000 },
>> +				{ 400000000 }, },
>> +		.reg = { "csid_lite1" },
>> +		.interrupt = { "csid_lite1" },
>> +		.csid = {
>> +			.is_lite = true,
>> +			.hw_ops = &csid_ops_680,
>> +			.parent_dev_ops = &vfe_parent_dev_ops,
>> +			.formats = &csid_formats_gen2,
>> +		},
>> +	},
>> +};
>> +
>> +static const struct camss_subdev_resources vfe_res_sm8450[] = {
>> +	/* IFE0 */
>> +	{
>> +		.regulators = {},
>> +		.clock = { "gcc_hf_axi", "camnoc_axi", "cpas_ahb",
>> +			   "core_ahb", "cpas_fast_ahb", "cpas_vfe0",
>> +			   "vfe0_fast_ahb", "vfe0" },
>> +		.clock_rate = { { 0 },
>> +				{ 300000000, 400000000 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 0 },
>> +				{ 432000000, 594000000, 675000000, 727000000 }, },
> 
> Nit:
> 	Can you align clock and clock_rate wrap method,
> 
> 	"gcc_hf_axi", "camnoc_axi", "cpas_ahb",
> 
> 	{0}, { 300000000, 400000000 }, {0},
> 
> 1st line have 3 clock at .clock,
> clock rate also 3 clock_rate.
> 
> So reader can know corresponding rate quickly,
> 
> 	for example, If I know rate of cpas_fast_ahb, reader can simple
> locate by second row and second col.

I'm reluctant to do such a change for v3, because it does not match
any of the current clock resource lists in the driver, which breaks
the established tradition.

If needed, this should be done for all clock resources in the driver
at once, but this is out of the scope of this changeset, so I do not
consider to update the change accordingly in a probable next version
of the changeset, which adds SM8450 CAMSS support.

-- 
Best wishes,
Vladimir
