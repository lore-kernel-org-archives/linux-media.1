Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011051.outbound.protection.outlook.com [40.93.194.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22663E49FD;
	Mon, 17 Aug 2026 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786959098; cv=fail; b=WKk7sCmxmBNThcqoJLOOfP+EPL3TUcDYOvox4iS0Gjf20Q0cYqqxjGooeYKgI/TiMoUw0EC00hoLDjAcCVZ8pi/hRXPVgVuY7zrQ5X2OND3r3JzAdmSyF7V+mSoL3nl7otJWb/sfKeZH5olaql7h4HV6QvR5u9FkasUmdTmnzeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786959098; c=relaxed/simple;
	bh=sZQlNFW0M3TXAwqKkN/FXbdVHx1UY2GzuupLUXagP/c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oYgIudzw7ZZklxGN9KJGWB29RA+RSAGpIg0pKy3mNEDV/MOQjFvjyWIBDMKePASe7Nu7ssbjncDVqhdTDbnCeGIYQJX/MpHhuoRBpSpKXT4IXT96RUlllpfmJZj2I1hBjjzZHAvIZsu7twA3ShT8B1yCNlDLu0AExLLe5gajgZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=CggEy/jb; arc=fail smtp.client-ip=40.93.194.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CggEy/jb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOz7xL9PIuXsx06NEOKZ33SG8gTB4oVuCGfz8+LjZnZRQda+AekQiu51AOBNrMjvp6g4HCJYjucJ4bnb4UvVAz+iYj+GJR6CGUZ+HijBCivUrBSXwaoG7g1ryTj2OF7aa82YRSWHrPf41GtobiHojh+wOhvLwvo57/05Dz6/6oPN2ru48zP+Pj0eJqLOH6Cx6JTseAKXwLjZ/ThZXJ2jCY6jMpVS4LuhkKZiFkJZmAnYRTIaCL8P2UFX4XrTDiygKz/5PsX2ebcW1rAJ9Rg7reqBwxLq81230O0tUfd8wVxgdamPVcWBRpq5YeiDX1bvKf81TSGLIM7DX4XWex0YIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWdBMJ82j9s9ntGR6B3p7I/KZciEwqxABxDq8PRBZJY=;
 b=An1uRrs8g9uZw3L8MFyvHqxfsr8khEUINaVz9bq5N/OX623o5C2pmAfufP7an3m6ZV2WalCo2o01Kf9OrFERceHvKAQMD77kQNPRbgeuxXJ1eGVoEQdHClwX1UrUco6fd1Ho16ghscpe0WCKp794KUUuYM3i66v/TjJa+kh2t5EGuvUFODUHaax+N/f5Gj9gXL7DONk5ep08mACinTrRpRjIL54TfBK+vxgf9kOsdRqYRwCoVgjhYj0w8KGevGsc3ztrJkAIJvrmEHC2AWaVn+leh4u6AveffXW/jqwLzLoi1kgU1SuzX95xruBs6jb03iU/37FJHqVE3bvSaeir6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWdBMJ82j9s9ntGR6B3p7I/KZciEwqxABxDq8PRBZJY=;
 b=CggEy/jbgVQfxOvgFN3d/5YxhExoKnRAASUOy79fFOyQ2EX6rJVR+71shB/U1hehnUzsJIYmGUbaAbrB0Tm6D9FcdwgugRfWnNMRD/PEVadzabqnveXapOqQ2qAGZZ+6PggXsDZxDYfICMZ3U5m/cN1BwH/9odvXoOsE8DQnCPAXTbwvBihVh35f/obY+8KjXNPG/RmC/q5dTBRfFHeX4fbdKElnq/zNZLBCMcDewPnXDVLGqSVlRjlhDBGTYm4BwTsjQmocn/+TRwGQeGXufAujBQyxGMH/zFOlxgdq6rb5TNRjvcIvPi6o1We7dY7junMrrvVrbPuS4sZkpSlhEA==
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 09:31:20 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e%4]) with mapi id 15.21.0315.008; Mon, 17 Aug 2026
 09:31:19 +0000
From: <Shravan.Chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>, <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
	<Praveen.Kumar@microchip.com>
Subject: RE: [PATCH V3] media: i2c: imx334: add new link frequency
 configuration
Thread-Topic: [PATCH V3] media: i2c: imx334: add new link frequency
 configuration
Thread-Index: AQHdIwwJKf6SsyeIpEyEVW2l8nzkn7aiD81Q
Date: Mon, 17 Aug 2026 09:31:19 +0000
Message-ID:
 <SA1PR11MB828028FC5D95B15624E030BA81A72@SA1PR11MB8280.namprd11.prod.outlook.com>
References: <20260803055034.3807438-1-shravan.chippa@microchip.com>
In-Reply-To: <20260803055034.3807438-1-shravan.chippa@microchip.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8280:EE_|SJ0PR11MB5770:EE_
x-ms-office365-filtering-correlation-id: 2015e590-0072-42dc-3ee6-08defc424b87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|3023799007|6133799003|18002099003|22082099003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 QgGUWXrbxK9KtpHi0L3MCAjIhLe93zFLS5zVm2oCZ3sKJtugVuXdk7pBFvG4BxTvrjyUpkNAffKqddDkm9gl1RL9jQ4KwULCeVmWH2rwyfQSlbIuQZwCk3DFlG1Orv5XqYDijcWnfiQH+gohRnE4JopgiucobQKfEBGEE/EuQfO4zvODPqYJwR6J/UXZB6pVw0dGQWe1EBlRHGhRs/5SKEaUkSZ8M5DuFHaaFl5qrCDxbjHcVjC2viw9I6sgwo0h6DEhPFDhHa/WCJZ+D3ULjc7gJHoabNNIpEpNGJI3rcgwUU0EFRu+B4NagA8dmIamRTrMAIVp6GXp+/7yUis/XnvYdt/TbHXDerl9VsPFBAZrl67F985iLO1a/iICgTx8uahRWwy11Nr1bZiCeaDC1iz8ZtoetZAdLIJB9WL65L1hB1S3Jlp/Bb398Ewei3/6/hm3q5mFZR+QpaHsWloss7ZT+O8g6S5n5tC/8ldfB+4Jka7QoIJ0OFiu2dQktsfb9kDsK0DtGcaahBLFEKrcq176STS4RWX3NocLZ7cNfkm0mWbz9rHNYxHJF/NDE2EfPAfKe5Br6BSdibqU1qdlh+Y8GrEIKC+SrLJiWGJid4H7r86Y8xBr1Z9kXmgjbba4rkZhbK0ZRyr4YPJPErmc7R82Dp7ctYzHcH20dbd3VB7FCxJOSXMjBzRjLDarPCg2h/fQ6DwIdV9VH1jyHwlA9FfkXNw3VSiaQdzh1S/DKaE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8280.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5LnARoS7+oP2aiTDlTOimj8jnXrJYyQAJZMGykehJMIi6cXxmpMMXq8ztIXB?=
 =?us-ascii?Q?8w6neNbdrXP7ykzp0zJneu/v1csEe3l1Ayrhj7hLhmPlN9QJ8a/Sc6Q9YS3j?=
 =?us-ascii?Q?AE3jR3nD+iaAnDQpUVGm6J5+lH8WlndKbFCG/1v+f3Un54ocDdoyDLiwGdQ5?=
 =?us-ascii?Q?xt4RFmmDkBfXwENbQtTHxRrOfgk9P0SQeGaXDdQPhA3IYI6wQUL+ntIZRxLO?=
 =?us-ascii?Q?PTUKSlv9fr+N7E94HUkjREs2j8qmgJN88dFn0Oc95SBfd3y7oAVXK84IoUtA?=
 =?us-ascii?Q?Fe3uqLDZJaVDDuXYBj417YGP3pkUi9D2wqu3CTO7lMgfyOCCT+h1aRTvWWRi?=
 =?us-ascii?Q?lboMxtihzE+XhOb6B7O+QvcgQbrcUicQTFUS9ckoPG4A+hCgn3nZb5gvQ33w?=
 =?us-ascii?Q?AlGDMGKOtGp8TV7HtASzK4/mAgr3lvcLe6EhIk3YZl6On0zQJwdE6Hd/imwu?=
 =?us-ascii?Q?SffnRJpcwSsUXSaVFStYDUxtYeadQt47tzUi4VxbtOelGDIX2A3JdihA/CXR?=
 =?us-ascii?Q?Al4hKiPpatU3AVCw32CC2OT/nYCOX0Ek1aEjM5QnjUlvg/LpNn8QdWxbjWxE?=
 =?us-ascii?Q?3Mh3ANwoZ6ztJoffJQVIYkOegh4jr8RnvtlK4X/yPwlt4JtZcztYEldtiAls?=
 =?us-ascii?Q?j4YRzXsJIDimOMQdNJVYdEpkQkRuOc/XgJTFulEJ/rD4SNnjbP1XHzxp/NHh?=
 =?us-ascii?Q?lv1kblvqQhULtzVylgKIJ0NXDXD3DgVxXkA92FvFe9/1bXnRv+Te5jgIbcL2?=
 =?us-ascii?Q?tBLqL0DAhBB3R7NHbGH8RE6sF2MgXY26/ViY5uOP8Zj8zwUv9NbAGHSimIR2?=
 =?us-ascii?Q?OrMhtqscVkbsbAfTPQpZtTCDZfFHeQ1YcM/dZX18Ws2u+bokAq0To4YJmpEX?=
 =?us-ascii?Q?BE+jSmFc9gdfPxyNda6OBoPzNJ/MxAOcH+dWkiaRV5mEbe1K35fPqTr50zxV?=
 =?us-ascii?Q?+PdzGceyJs56iwvZz9121xXCaZ5aLXPbENJuSxEX9PEj25Ftsa5o7Rpfx52e?=
 =?us-ascii?Q?vzYOv29Ngs2FK4cxKs0Rh6QlztfQW8wByI93vpaauSbzMt7Vx/PwhKTVZNEZ?=
 =?us-ascii?Q?6RnTZgHVrdhSeDXTxRgFmHlJpAdq00Bc2uofzjEA0SJXvZO90efVvFVqAza7?=
 =?us-ascii?Q?7ke3+FwVCp565FayF60f0rA4Huu1dszwA3iOzzePi5sV5sECewC4Yo6SUywH?=
 =?us-ascii?Q?/yVFiSbdjdIA3Pris1fhIzG5/KZa0WVh3i0HqI8MlSASyATwdQhF3m+T66UX?=
 =?us-ascii?Q?GRV83COXCRkXKX788oVcpQb30scw3RGQYEDrrNyBtnYptO888GvYDPnjvWjK?=
 =?us-ascii?Q?Nz1w2SkKaE3RR8qCYaZJGz0MlljuCE7/IxCtivlSEbCbr5J6MoJrlFhaOR2f?=
 =?us-ascii?Q?mdTi8k4GoXUHS1tcy7Cwc9bD45mye89Z2i0jkmxKUgL743BcLiUs4FkD++fm?=
 =?us-ascii?Q?S7goVDI+uhK0oTqqKb5SKW7uhEjs5e3l64H4LUBBDvpMdwnjLfzIlsyaLZmu?=
 =?us-ascii?Q?UYVMO18XIIhs/uYYoIAZ4HNgqf98YsmPMzAb3TmA4Utiz6yHIDfeLouoCzdF?=
 =?us-ascii?Q?HaTgHSiwwolcDOSEU1KxUZMSSI0hH6VZo9hnHzXhMZfHVimjCpF/mWflDohp?=
 =?us-ascii?Q?ICspwvmME3NWkt+0VFouidGrb+sOFtUsmtUXBL5oOURpkbArFR7U1KoZ0xAG?=
 =?us-ascii?Q?0AbKPwcxy7NjmL7ElEvd/xOuoHAAHhadapuOmf38e5hwF3yZpq/KfxIo4oZm?=
 =?us-ascii?Q?MnUWztu7Zw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2015e590-0072-42dc-3ee6-08defc424b87
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 09:31:19.7835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5aIAqsHI9ikFbqPEk+P8JJaeH3972oZ6Vi3P8OvOLEnJChBWI3UPrpuBoJScQZE2zUEv4bAIipuS1xv5YNvr0J2qBLoqX6NU0h3Zcsqv6xA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770

Hi Sakari,

I am sending a gentle ping on this patch. Please let me know if you
have any feedback or if any changes are required.

Regards,
Shravan

> -----Original Message-----
> From: shravan kumar <shravan.chippa@microchip.com>
> Sent: Monday, August 3, 2026 11:21 AM
> To: sakari.ailus@linux.intel.com; mchehab@kernel.org
> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dool=
ey -
> M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> I30718 <Praveen.Kumar@microchip.com>; shravan Chippa - I35088
> <Shravan.Chippa@microchip.com>
> Subject: [PATCH V3] media: i2c: imx334: add new link frequency configurat=
ion
>=20
> From: Shravan Chippa <shravan.chippa@microchip.com>
>=20
> Add 222 MHz link frequency support and refactor clock registers into per-
> frequency register lists. Introduce imx334_clk_params to map each link
> frequency to its register set and supported resolution range.
> Make the link frequency control writable so userspace can select the desi=
red
> operating point.
>=20
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
>=20
> ---
> Changes from V2 -> V3
>=20
> - Refactor: Introduce struct imx334_clk_params
>     - Maps each link frequency to its clock register set and supported
>       resolution range (width_max, height_max, width_min, height_min).
>     - Includes a default_mode pointer for fallback when resolution is
>       out of range for the selected link frequency.
>=20
> - Enhancement: Make link_freq control writable
>     - Removed V4L2_CTRL_FLAG_READ_ONLY from link_freq_ctrl so userspace
>       can select the desired link frequency operating point.
>=20
> - Enhancement: Add resolution bounds checking in set_pad_format
>     - imx334_set_pad_format() now validates the selected mode against
>       the clk_params width/height constraints and falls back to the
>       default mode if out of range.
>=20
> - Cleanup: Remove __v4l2_ctrl_s_ctrl for link_freq in update_controls
>     - Link frequency is no longer tied to mode, so the explicit control
>       update in imx334_update_controls() was removed.
>=20
>=20
> Changes from V1 -> V2
>=20
> - Fix: Default mode selection bug
>     - Problem: Used __ffs(link_freq_bitmap) as index into the compacted
>       active_modes array. This index corresponds to a bit position in the
>       bitmap, not an array index in the filtered modes list.
>     - Fix: Use index 0, which is always the first valid mode in the
>       filtered array.
>=20
> - Fix: Rename fields for clarity
>     - Renamed struct fields:
>       * new_supported_modes -> active_modes
>       * new_modes_size -> num_active_modes
>     - Updated kernel-doc header for struct imx334 to document new fields.
>=20
> - Fix: INCKSEL2 register write - add error handling and switch-case
>     - Location: imx334_enable_streams()
>     - Problem: Original code only handled 222 MHz case with no error
>       checking (passed NULL to cci_write).
>     - Fix: Replaced with switch-case covering all three link frequencies:
>       * 891 MHz -> INCKSEL2 =3D 0x02
>       * 445 MHz -> INCKSEL2 =3D 0x06
>       * 222 MHz -> INCKSEL2 =3D 0x0a
>     - Added proper error handling using &ret accumulator pattern with
>       dev_err and goto err_rpm_put on failure.
>=20
> - Fix: Use BIT() macro
>     - Location: imx334_update_supported_mode_array()
>     - Replaced (1 << i) with BIT(i) for kernel coding style compliance.
>=20
> - Fix: Use devm_kmalloc_array() for overflow-safe allocation
>     - Location: imx334_update_supported_mode_array()
>     - Replaced: devm_kmalloc(dev, n * sizeof(struct imx334_mode),
>  GFP_KERNEL)
>     - With: devm_kmalloc_array(dev, n, sizeof(*temp_ptr), GFP_KERNEL)
>     - Provides overflow-safe multiplication and uses sizeof(*ptr) idiom.
>=20
> - Cleanup: Condensed copy loop
>     - Location: imx334_update_supported_mode_array(), second loop
>     - Simplified the struct copy with post-increment:
>       temp_ptr[size++] =3D supported_modes[j];
>=20
> - Fix: Updated function kernel-doc comment
>     - Location: imx334_update_supported_mode_array()
>     - Reworded: "Search for the supported modes add them in the new list"
>     - To: "Build filtered modes array based on DTS link frequencies"
>=20
> - IMX334_LINK_FREQ_222M changed from 222500000 to 222750000
>=20
> ---
>=20
>  drivers/media/i2c/imx334.c | 132 +++++++++++++++++++++++++++++++--
> ----
>  1 file changed, 112 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c inde=
x
> 553a16b84f4d..fb036873859c 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -109,6 +109,7 @@
>  /* CSI2 HW configuration */
>  #define IMX334_LINK_FREQ_891M		891000000
>  #define IMX334_LINK_FREQ_445M		445500000
> +#define IMX334_LINK_FREQ_222M		222750000
>  #define IMX334_NUM_DATA_LANES		4
>=20
>  #define IMX334_REG_MIN			0x00
> @@ -154,7 +155,6 @@ struct imx334_reg_list {
>   * @vblank_min: Minimal vertical blanking in lines
>   * @vblank_max: Maximum vertical blanking in lines
>   * @pclk: Sensor pixel clock
> - * @link_freq_idx: Link frequency index
>   * @reg_list: Register list for sensor mode
>   */
>  struct imx334_mode {
> @@ -165,7 +165,28 @@ struct imx334_mode {
>  	u32 vblank_min;
>  	u32 vblank_max;
>  	u64 pclk;
> -	u32 link_freq_idx;
> +	struct imx334_reg_list reg_list;
> +};
> +
> +/**
> + * struct imx334_clk_params - imx334 sensor clock parameters
> + * @data_rate_per_lane: Data rate per lane in bits per second
> + * @link_freq: Link frequency in Hz
> + * @width_max: Maximum image width in pixels
> + * @height_max: Maximum image height in pixels
> + * @width_min: Minimum image width in pixels
> + * @height_min: Minimum image height in pixels
> + * @default_mode: Pointer to the default sensor mode
> + * @reg_list: Register list for clock configuration  */ struct
> +imx334_clk_params {
> +	u32 data_rate_per_lane;
> +	u32 link_freq;
> +	u32 width_max;
> +	u32 height_max;
> +	u32 width_min;
> +	u32 height_min;
> +	const struct imx334_mode *default_mode;
>  	struct imx334_reg_list reg_list;
>  };
>=20
> @@ -216,6 +237,7 @@ struct imx334 {
>  static const s64 link_freq[] =3D {
>  	IMX334_LINK_FREQ_891M,
>  	IMX334_LINK_FREQ_445M,
> +	IMX334_LINK_FREQ_222M,
>  };
>=20
>  /* Sensor common mode registers values */ @@ -233,13 +255,6 @@ static
> const struct cci_reg_sequence common_mode_regs[] =3D {
>  	{ IMX334_REG_UNREAD_PARAM6,	0x0008 },
>  	{ IMX334_REG_XVS_XHS_OUTSEL,	0x20 },
>  	{ IMX334_REG_XVS_XHS_DRV,	0x0f },
> -	{ IMX334_REG_BCWAIT_TIME,	0x3b },
> -	{ IMX334_REG_CPWAIT_TIME,	0x2a },
> -	{ IMX334_REG_INCKSEL1,		0x0129 },
> -	{ IMX334_REG_INCKSEL2,		0x06 },
> -	{ IMX334_REG_INCKSEL3,		0xa0 },
> -	{ IMX334_REG_INCKSEL4,		0x7e },
> -	{ IMX334_REG_SYS_MODE,		0x02 },
>  	{ IMX334_REG_HADD_VADD,		0x00 },
>  	{ IMX334_REG_VALID_EXPAND,	0x03 },
>  	{ IMX334_REG_TCYCLE,		0x00 },
> @@ -397,6 +412,39 @@ static const struct cci_reg_sequence
> mode_3840x2160_regs[] =3D {
>  	{ IMX334_REG_TPLX,		0x005f },
>  };
>=20
> +/* Data rate 1782Mbps per lane and 891Mhz link frequency */ static
> +const struct cci_reg_sequence link_freq_891m_regs[] =3D {
> +	{ IMX334_REG_BCWAIT_TIME,	0x3b },
> +	{ IMX334_REG_CPWAIT_TIME,	0x2a },
> +	{ IMX334_REG_INCKSEL1,		0x0129 },
> +	{ IMX334_REG_INCKSEL2,		0x02 },
> +	{ IMX334_REG_INCKSEL3,		0xa0 },
> +	{ IMX334_REG_INCKSEL4,		0x7e },
> +	{ IMX334_REG_SYS_MODE,		0x00 },
> +};
> +
> +/* Data rate 891Mbps per lane and 445Mhz link frequency */ static const
> +struct cci_reg_sequence link_freq_445m_regs[] =3D {
> +	{ IMX334_REG_BCWAIT_TIME,	0x3b },
> +	{ IMX334_REG_CPWAIT_TIME,	0x2a },
> +	{ IMX334_REG_INCKSEL1,		0x0129 },
> +	{ IMX334_REG_INCKSEL2,		0x06 },
> +	{ IMX334_REG_INCKSEL3,		0xa0 },
> +	{ IMX334_REG_INCKSEL4,		0x7e },
> +	{ IMX334_REG_SYS_MODE,		0x02 },
> +};
> +
> +/* Data rate 445Mbps per lane and 222Mhz link frequency */ static const
> +struct cci_reg_sequence link_freq_222m_regs[] =3D {
> +	{ IMX334_REG_BCWAIT_TIME,	0x3b },
> +	{ IMX334_REG_CPWAIT_TIME,	0x2a },
> +	{ IMX334_REG_INCKSEL1,		0x0129 },
> +	{ IMX334_REG_INCKSEL2,		0x0a },
> +	{ IMX334_REG_INCKSEL3,		0xa0 },
> +	{ IMX334_REG_INCKSEL4,		0x7e },
> +	{ IMX334_REG_SYS_MODE,		0x02 },
> +};
> +
>  static const char * const imx334_test_pattern_menu[] =3D {
>  	"Disabled",
>  	"Vertical Color Bars",
> @@ -442,7 +490,6 @@ static const struct imx334_mode supported_modes[]
> =3D {
>  		.vblank_min =3D 90,
>  		.vblank_max =3D 132840,
>  		.pclk =3D 594000000,
> -		.link_freq_idx =3D 0,
>  		.reg_list =3D {
>  			.num_of_regs =3D
> ARRAY_SIZE(mode_3840x2160_regs),
>  			.regs =3D mode_3840x2160_regs,
> @@ -455,7 +502,6 @@ static const struct imx334_mode supported_modes[]
> =3D {
>  		.vblank_min =3D 45,
>  		.vblank_max =3D 132840,
>  		.pclk =3D 297000000,
> -		.link_freq_idx =3D 1,
>  		.reg_list =3D {
>  			.num_of_regs =3D
> ARRAY_SIZE(mode_1920x1080_regs),
>  			.regs =3D mode_1920x1080_regs,
> @@ -468,7 +514,6 @@ static const struct imx334_mode supported_modes[]
> =3D {
>  		.vblank_min =3D 45,
>  		.vblank_max =3D 132840,
>  		.pclk =3D 297000000,
> -		.link_freq_idx =3D 1,
>  		.reg_list =3D {
>  			.num_of_regs =3D ARRAY_SIZE(mode_1280x720_regs),
>  			.regs =3D mode_1280x720_regs,
> @@ -481,7 +526,6 @@ static const struct imx334_mode supported_modes[]
> =3D {
>  		.vblank_min =3D 45,
>  		.vblank_max =3D 132840,
>  		.pclk =3D 297000000,
> -		.link_freq_idx =3D 1,
>  		.reg_list =3D {
>  			.num_of_regs =3D ARRAY_SIZE(mode_640x480_regs),
>  			.regs =3D mode_640x480_regs,
> @@ -489,6 +533,46 @@ static const struct imx334_mode
> supported_modes[] =3D {
>  	},
>  };
>=20
> +static const struct imx334_clk_params imx334_clk_params[] =3D {
> +	{
> +		.data_rate_per_lane =3D 1782000000,
> +		.link_freq =3D IMX334_LINK_FREQ_891M,
> +		.width_max =3D 3840,
> +		.height_max =3D 2160,
> +		.width_min =3D 3840,
> +		.height_min =3D 2160,
> +		.default_mode =3D &supported_modes[0], /* 3840x2160 */
> +		.reg_list =3D {
> +			.num_of_regs =3D ARRAY_SIZE(link_freq_891m_regs),
> +			.regs =3D link_freq_891m_regs,
> +		},
> +	}, {
> +		.data_rate_per_lane =3D 891000000,
> +		.link_freq =3D IMX334_LINK_FREQ_445M,
> +		.width_max =3D 1920,
> +		.height_max =3D 1080,
> +		.width_min =3D 640,
> +		.height_min =3D 480,
> +		.default_mode =3D &supported_modes[1], /* 1920x1080 */
> +		.reg_list =3D {
> +			.num_of_regs =3D ARRAY_SIZE(link_freq_445m_regs),
> +			.regs =3D link_freq_445m_regs,
> +		},
> +	}, {
> +		.data_rate_per_lane =3D 445500000,
> +		.link_freq =3D IMX334_LINK_FREQ_222M,
> +		.width_max =3D 1920,
> +		.height_max =3D 1080,
> +		.width_min =3D 640,
> +		.height_min =3D 480,
> +		.default_mode =3D &supported_modes[1], /* 1920x1080 */
> +		.reg_list =3D {
> +			.num_of_regs =3D ARRAY_SIZE(link_freq_222m_regs),
> +			.regs =3D link_freq_222m_regs,
> +		},
> +	}
> +};
> +
>  /**
>   * to_imx334() - imv334 V4L2 sub-device to imx334 device.
>   * @subdev: pointer to imx334 V4L2 sub-device @@ -512,10 +596,6 @@
> static int imx334_update_controls(struct imx334 *imx334,  {
>  	int ret;
>=20
> -	ret =3D __v4l2_ctrl_s_ctrl(imx334->link_freq_ctrl, mode->link_freq_idx)=
;
> -	if (ret)
> -		return ret;
> -
>  	ret =3D __v4l2_ctrl_modify_range(imx334->pclk_ctrl, mode->pclk,
>  				       mode->pclk, 1, mode->pclk);
>  	if (ret)
> @@ -746,6 +826,7 @@ static int imx334_set_pad_format(struct v4l2_subdev
> *sd,  {
>  	struct imx334 *imx334 =3D to_imx334(sd);
>  	const struct imx334_mode *mode;
> +	const struct imx334_clk_params *clk_params;
>  	int ret =3D 0;
>=20
>  	mode =3D v4l2_find_nearest_size(supported_modes,
> @@ -753,6 +834,11 @@ static int imx334_set_pad_format(struct
> v4l2_subdev *sd,
>  				      width, height,
>  				      fmt->format.width, fmt->format.height);
>=20
> +	clk_params =3D &imx334_clk_params[imx334->link_freq_ctrl->val];
> +	if (mode->width > clk_params->width_max || mode->height >
> clk_params->height_max ||
> +	    mode->width < clk_params->width_min || mode->height <
> clk_params->height_min)
> +		mode =3D clk_params->default_mode;
> +
>  	imx334_fill_pad_format(imx334, mode, fmt);
>  	fmt->format.code =3D imx334_get_format_code(imx334, fmt-
> >format.code);
>=20
> @@ -824,6 +910,15 @@ static int imx334_enable_streams(struct
> v4l2_subdev *sd,
>  		goto err_rpm_put;
>  	}
>=20
> +	/* Write sensor link freq registers */
> +	reg_list =3D &imx334_clk_params[imx334->link_freq_ctrl->val].reg_list;
> +	ret =3D cci_multi_reg_write(imx334->cci, reg_list->regs,
> +				  reg_list->num_of_regs, NULL);
> +	if (ret) {
> +		dev_err(imx334->dev, "fail to write initial registers\n");
> +		goto err_rpm_put;
> +	}
> +
>  	/* Write sensor mode registers */
>  	reg_list =3D &imx334->cur_mode->reg_list;
>  	ret =3D cci_multi_reg_write(imx334->cci, reg_list->regs, @@ -1096,9
> +1191,6 @@ static int imx334_init_controls(struct imx334 *imx334)
>  							__ffs(imx334-
> >link_freq_bitmap),
>  							link_freq);
>=20
> -	if (imx334->link_freq_ctrl)
> -		imx334->link_freq_ctrl->flags |=3D
> V4L2_CTRL_FLAG_READ_ONLY;
> -
>  	imx334->hblank_ctrl =3D v4l2_ctrl_new_std(ctrl_hdlr,
>  						&imx334_ctrl_ops,
>  						V4L2_CID_HBLANK,
> --
> 2.34.1

