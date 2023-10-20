<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/">
	<fo:root>
  		<!-- The full XSL-FO document goes here -->
		<fo:layout-master-set>
  			<!-- All page templates go here -->
			<!--This is the part where we create the page and set its properties-->
			<!--The page width and height 297 by 210 because it is A4 page-->
			<!--Margins are set to be 0.5 cm-->
			<fo:simple-page-master master-name="RecipeCatalog"
								   page-width="210mm" page-height="297mm"
								   margin-top="0.5cm"   margin-bottom="0.5cm"
								   margin-left="0.5cm"  margin-right="0.5cm">
				<fo:region-body   margin="0mm"/>
				<!--This is header-->
				<fo:region-before extent="0mm"/>
				<!--This is footer-->
				<fo:region-after  extent="0mm"/>
				<!--This is left side indentation-->
				<fo:region-start  extent="0mm"/>
				<!--This is right side indentation-->
				<fo:region-end    extent="0mm"/>
			</fo:simple-page-master>
		</fo:layout-master-set>

		<!--This is where the content for each page goes-->
		<!-- Let's start with the cover page-->
		<!-- When we use percentage it scales the original size to the given percentage-->
		<!-- ~~~~~~~~~~~~~~~~~~~~~~~~Header~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
		<fo:page-sequence master-reference="RecipeCatalog">
			<fo:flow flow-name="xsl-region-body">
				<fo:block position="absolute" text-align="center">
					<fo:external-graphic src="url('images/korica.jpg')"
										 text-align="center"
										 margin-top="-1cm"
										 margin-bottom="0mm" content-height="63%" content-width="63%"></fo:external-graphic>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>

		<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~Recipes~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
		<fo:page-sequence master-reference="RecipeCatalog">
			<fo:flow flow-name="xsl-region-body">
				<fo:block position="relative"
						  text-align="center"
						  font-family="Monotype Corsiva"
						  font-style="normal"
						  font-size="22pt"
						  padding-before="10mm">
					Рецепти от Южен-централен регион
				</fo:block>
				<fo:block position="relative" padding-before="5mm">
					<xsl:for-each select="/catalog/recipes/recipe[@region-ID='SC']">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</fo:block>
				<fo:block position="relative"
						  text-align="center"
						  font-family="Monotype Corsiva"
						  font-style="normal"
						  font-size="22pt"
						  padding-before="10mm">
					Рецепти от Северозападен регион
				</fo:block>
				<fo:block position="relative" padding-before="5mm">
					<xsl:for-each select="/catalog/recipes/recipe[@region-ID='NW']">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</fo:block>
				<fo:block position="relative"
						  text-align="center"
						  font-family="Monotype Corsiva"
						  font-style="normal"
						  font-size="22pt"
						  padding-before="10mm">
					Рецепти от Северен-централен регион
				</fo:block>
				<fo:block position="relative" padding-before="5mm">
					<xsl:for-each select="/catalog/recipes/recipe[@region-ID='NC']">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</fo:block>
				<fo:block position="relative"
						  text-align="center"
						  font-family="Monotype Corsiva"
						  font-style="normal"
						  font-size="22pt"
						  padding-before="10mm">
					Рецепти от Североизточен регион
				</fo:block>
				<fo:block position="relative" padding-before="5mm">
					<xsl:for-each select="/catalog/recipes/recipe[@region-ID='NE']">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</fo:block>
				<fo:block position="relative"
						  text-align="center"
						  font-family="Monotype Corsiva"
						  font-style="normal"
						  font-size="22pt"
						  padding-before="10mm">
					Рецепти от Югозападен регион
				</fo:block>
				<fo:block position="relative" padding-before="5mm">
					<xsl:for-each select="/catalog/recipes/recipe[@region-ID='SW']">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</fo:block>
				<fo:block position="relative"
						  text-align="center"
						  font-family="Monotype Corsiva"
						  font-style="normal"
						  font-size="22pt"
						  padding-before="10mm">
					Рецепти от Югоизточен регион
				</fo:block>
				<fo:block position="relative" padding-before="5mm">
					<xsl:for-each select="/catalog/recipes/recipe[@region-ID='SE']">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</fo:block>
				<fo:block position="relative"
						  text-align="center"
						  font-family="Monotype Corsiva"
						  font-style="normal"
						  font-size="22pt"
						  padding-before="10mm">
					Рецепти с неизвестен произход
				</fo:block>
				<fo:block position="relative" padding-before="5mm">
					<xsl:for-each select="/catalog/recipes/recipe[@region-ID='NA']">
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</fo:root>
   </xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~Recipe~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="recipe">
			<fo:block position="relative"
					  text-align="center"
					  font-family="Monotype Corsiva"
					  font-style="normal"
					  color="black"
					  font-size="20pt"
					  padding-before="10mm">
				<xsl:value-of select="./name/text()"/>
			</fo:block>

			<fo:block position="absolute"
					  text-align="center"
					  padding-before="10mm"
					  padding-after="5mm"
					  content-height="25%"
					  content-width="25%">
				<xsl:apply-templates select="./image"/>
			</fo:block>

			<fo:block position="relative" font-family="Book Antiqua" font-style="normal" font-size="14pt" color="black"
					  padding-before="5mm" padding-after="2mm">
				Произход:
				<fo:block position="relative" padding-before="5mm" padding-left="5mm" font-size="12pt">
					<xsl:value-of select="./origin/text()"/>
				</fo:block>

			</fo:block>

			<fo:block position="relative" font-family="Book Antiqua" font-style="normal" font-size="14pt" color="black"
					  padding-before="5mm" padding-after="2mm">
				Необходими продукти:
				<fo:block position="relative" padding-before="5mm" padding-left="5mm" font-size="12pt">
					<xsl:for-each select="./ingredients/list/item">
						<fo:block start-indent="50pt">
							<xsl:apply-templates select="."/>
						</fo:block>
					</xsl:for-each>
				</fo:block>
			</fo:block>

			<fo:block position="relative" font-family="Book Antiqua" font-style="normal" font-size="14pt" color="black"
					  padding-before="5mm" padding-after="2mm">
				Стъпки на приготвяне:
				<fo:block position="relative" padding-before="5mm" padding-left="5mm" font-size="12pt">
					<xsl:value-of select="./preparation-steps/text()"/>
				</fo:block>
			</fo:block>

			<fo:block position="relative" font-family="Book Antiqua" font-style="normal" font-size="14pt" color="black"
					  padding-before="5mm">
				Начин на сервиране:
				<fo:block position="relative" padding-before="5mm" padding-left="5mm" font-size="12pt">
					<xsl:value-of select="./how-to-serve/text()"/>
				</fo:block>
			</fo:block>

			<fo:block position="relative" font-family="Book Antiqua" font-style="normal" font-size="14pt" color="black"
					  padding-before="5mm" padding-after="2mm">
				Подходящи напитки:
				<fo:block position="relative" padding-before="5mm" padding-left="5mm" font-size="12pt">
					<xsl:value-of select="./suitable-drinks/text()"/>
				</fo:block>
			</fo:block>

			<fo:block position="relative" font-family="Book Antiqua" font-style="normal" font-size="14pt" color="black"
					  padding-before="5mm" padding-after="2mm">
				Медицински параметри:
				<fo:block position="relative" padding-before="5mm" padding-left="5mm" font-size="12pt">
					<xsl:value-of select="./medical-parameters/text()"/>
				</fo:block>
			</fo:block>

			<fo:block position="relative" font-family="Book Antiqua" font-style="normal" font-size="14pt" color="black">
				Алергени:
				<fo:block position="relative" padding-before="5mm" padding-left="5mm" font-size="12pt">
					<xsl:for-each select="./allergens/allergen">
						<fo:block start-indent="50pt">
							<xsl:apply-templates select="."/>
						</fo:block>
					</xsl:for-each>
				</fo:block>
			</fo:block>
		</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~Image~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="image">
		<fo:external-graphic src="{unparsed-entity-uri(@href)}" content-height="40%" content-width="40%"/>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~Ingredients~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="ingredients">
		<fo:block>
			<xsl:value-of select="./item/text()"/>
		</fo:block>
	</xsl:template>

	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~Allergens~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<xsl:template match="allergens">
		<fo:block>
			<xsl:value-of select="./allergen/text()"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>